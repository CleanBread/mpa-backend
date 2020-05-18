package com.itmo.mpa.controller

import com.itmo.mpa.dto.response.MedicineResponse
import com.itmo.mpa.service.MedicineService
import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import org.springframework.web.bind.annotation.*

@RestController
@Api("/medicines")
@RequestMapping("medicines")
class MedicineController(private val medicineService: MedicineService) {
    @GetMapping
    @ApiOperation("Get all medicines")
    fun getAll(): List<MedicineResponse> = medicineService.findAll()

    @GetMapping("{id}")
    @ApiOperation("Find medicine by id")
    fun getById(@PathVariable id: Long): MedicineResponse = medicineService.findMedicine(id)
}
