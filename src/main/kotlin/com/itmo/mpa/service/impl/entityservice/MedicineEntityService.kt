package com.itmo.mpa.service.impl.entityservice

import com.itmo.mpa.entity.medicine.Medicine
import com.itmo.mpa.repository.MedicineRepository
import com.itmo.mpa.service.exception.MedicineNotFoundException
import org.slf4j.LoggerFactory
import org.springframework.data.repository.findByIdOrNull
import org.springframework.stereotype.Service;



@Service
public class MedicineEntityService (
        private val medicineRepository: MedicineRepository
) {
    private val logger = LoggerFactory.getLogger(javaClass)

    fun findMedicine(medicineId: Long): Medicine {
        logger.info("findMedicine: {}", medicineId)
        return medicineRepository.findByIdOrNull(medicineId) ?: throw MedicineNotFoundException(medicineId)
    }
}
