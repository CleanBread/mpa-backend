package com.itmo.mpa.service

import com.itmo.mpa.dto.response.AppropriateMedicineResponse
import com.itmo.mpa.dto.response.MedicineResponse
import com.itmo.mpa.service.exception.NoPendingDraftException
import com.itmo.mpa.service.exception.PatientNotFoundException

interface MedicineService {

    /**
     *  Returns list of all appropriate medicine transitions depending on state of the for patient by [patientId].
     *  [AppropriateMedicineResponse.isNotRecommended] will be set according to the
     *  value produced by predicate of contradictions. It wil be set to `null` in case of any error occurred.
     *  If that's the case, [AppropriateMedicineResponse.errorCause] will be populated with description
     *
     *  @param patientId patient id
     *  @return found available transitions
     *  @throws [PatientNotFoundException]Ё if patient not found
     *  @throws [NoPendingDraftException] if no draft is pending for a patient
     */
    fun getAppropriateMedicine(patientId: Long): List<AppropriateMedicineResponse>

    fun findAll(): List<MedicineResponse>

    fun findMedicine(id: Long): MedicineResponse
}
