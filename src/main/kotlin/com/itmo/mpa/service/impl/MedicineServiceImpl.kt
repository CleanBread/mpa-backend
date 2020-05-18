package com.itmo.mpa.service.impl

import com.itmo.mpa.dto.response.AppropriateMedicineResponse
import com.itmo.mpa.dto.response.MedicineResponse
import com.itmo.mpa.entity.Contradiction
import com.itmo.mpa.entity.Patient
import com.itmo.mpa.entity.Status
import com.itmo.mpa.repository.ContradictionsRepository
import com.itmo.mpa.repository.MedicineRepository
import com.itmo.mpa.service.MedicineService
import com.itmo.mpa.service.PredicateService
import com.itmo.mpa.service.impl.entityservice.MedicineEntityService
import com.itmo.mpa.service.impl.entityservice.PatientStatusEntityService
import com.itmo.mpa.service.mapping.toResponse
import org.slf4j.LoggerFactory
import org.springframework.stereotype.Service

@Service
class MedicineServiceImpl(
    private val patientStatusEntityService: PatientStatusEntityService,
    private val contradictionsRepository: ContradictionsRepository,
    private val medicineRepository: MedicineRepository,
    private val medicineEntityService: MedicineEntityService,
    private val predicateService: PredicateService
) : MedicineService {

    private val logger = LoggerFactory.getLogger(javaClass)

    override fun getAppropriateMedicine(patientId: Long): List<AppropriateMedicineResponse> {
        val (draft, patient) = patientStatusEntityService.requireDraftWithPatient(patientId)
        return contradictionsRepository.findAll()
                .groupBy { it.medicine.id }
                .map { (_, contradictions) -> contradictions.formResponse(patient, draft) }
                .also { logger.debug("getAvailableTransitions: result {}", it) }
    }

    private fun List<Contradiction>.formResponse(
        patient: Patient,
        draft: Status
    ): AppropriateMedicineResponse {
        val medicineResponse = this.first().medicine.toResponse()
        val notRecommendedResults = this.map { it.isNotRecommended(patient, draft) }
        val notRecommendedList = notRecommendedResults.map { it.first }
        val errors = notRecommendedResults.mapNotNull { it.second }
        val isNotRecommended = when {
            errors.isNotEmpty() -> null
            else -> notRecommendedList.contains(true)
        }
        val errorsList = when {
            errors.isNotEmpty() -> errors
            else -> null
        }
        return AppropriateMedicineResponse(medicineResponse, isNotRecommended, errorsList)
    }

    private fun Contradiction.isNotRecommended(
        patient: Patient,
        draft: Status
    ): Pair<Boolean?, String?> {
        return predicateService.testPredicate(patient, draft, predicate)
                .mapLeft { it.toString() }
                .fold({ null to it }, { it to null })
    }

    override fun findAll(): List<MedicineResponse> {
        logger.info("findAll: Query all medicines from the database")
        return medicineRepository.findAll().map { it.toResponse() }
                .also { logger.debug("findAll returned {}", it) }
    }

    override fun findMedicine(id: Long): MedicineResponse {
        logger.info("findMedicine: find medicine by id {}", id)
        val medicine = medicineEntityService.findMedicine(id)
        return medicine.toResponse()
                .also { logger.info("findMedicine {} returned {}", id, it) }
    }
}
