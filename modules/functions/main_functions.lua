MainFunctions = { 
    description = "Main Functions"
}

--These are commented out on purpose, probably should have deleted them but im keeping them for reference only
--function MainFunctions()

	function MainFunctions.cloneVehicleSettings(fullVehicleNameToUse, ShouldCloneVehicleEngineData, ShouldCloneVehicleDriveModelData, ShouldCloneVehicleDataPackage, ShouldCloneVehicleWheelDimensionsSetup, ShouldCloneVehicleWheelSetup, IsBike)
		if ShouldCloneVehicleEngineData == true then
			TweakDB:CloneRecord((fullVehicleNameToUse.."_full_enginedata"), TweakDB:GetFlat(fullVehicleNameToUse..".vehEngineData"))
		end
		if ShouldCloneVehicleDriveModelData == true then
			if IsBike == true then
				TweakDB:CloneRecord(fullVehicleNameToUse.."_full_vehDriveModelData", TweakDB:GetFlat(fullVehicleNameToUse..".bikeDriveModelData"))
			else
				TweakDB:CloneRecord(fullVehicleNameToUse.."_full_vehDriveModelData", TweakDB:GetFlat(fullVehicleNameToUse..".vehDriveModelData"))
			end
		end
		if ShouldCloneVehicleDataPackage == true then
			TweakDB:CloneRecord(fullVehicleNameToUse.."_full_vehDataPackage", TweakDB:GetFlat(fullVehicleNameToUse..".vehDataPackage"))
		end
		if ShouldCloneVehicleWheelDimensionsSetup == true then
			TweakDB:CloneRecord(fullVehicleNameToUse.."_full_vehWheelDimensionsSetup", TweakDB:GetFlat(fullVehicleNameToUse..".vehWheelDimensionsSetup"))
		end
		if ShouldCloneVehicleWheelSetup == true then
			DriveModelHelper = TweakDB:GetFlat(fullVehicleNameToUse..".vehDriveModelData")
			if IsBike == true then
				DriveModelHelper = TweakDB:GetFlat(fullVehicleNameToUse..".bikeDriveModelData")
			end		
			TweakDB:CloneRecord(fullVehicleNameToUse.."_full_vehWheelSetup", TweakDB:GetFlat(DriveModelHelper..".wheelSetup"))
			TweakDB:CloneRecord(fullVehicleNameToUse.."_full_vehWheelSetupFrontPreset", TweakDB:GetFlat(fullVehicleNameToUse.."_full_vehWheelSetup.frontPreset"))
			TweakDB:CloneRecord(fullVehicleNameToUse.."_full_vehWheelSetupRearPreset", TweakDB:GetFlat(fullVehicleNameToUse.."_full_vehWheelSetup.backPreset"))
		end
	end

	function MainFunctions.setVehicleSettings(vehicleToSetTo, VehicleEngineDataToSet, VehicleDriveModelDataToSet, VehicleDataPackageToSet, VehicleWheelDimensionsSetupToSet, IsBike)
	TweakDB:SetFlat(vehicleToSetTo..".vehEngineData", VehicleEngineDataToSet)
	if IsBike == true then
		TweakDB:SetFlat(vehicleToSetTo..".bikeDriveModelData", VehicleDriveModelDataToSet)
	else
		TweakDB:SetFlat(vehicleToSetTo..".vehDriveModelData", VehicleDriveModelDataToSet)
	end
	TweakDB:SetFlat(vehicleToSetTo..".vehDataPackage", VehicleDataPackageToSet)
	TweakDB:SetFlat(vehicleToSetTo..".vehWheelDimensionsSetup", VehicleWheelDimensionsSetupToSet)
	end

	function MainFunctions.setGearData(gearToSetDataTo, torqueMultiplierToSet, minSpeedToSet, maxSpeedToSet, minEngineRPMToSet, maxEngineRPMToSet)
	TweakDB:SetFlat(gearToSetDataTo..".torqueMultiplier", torqueMultiplierToSet)
	TweakDB:SetFlat(gearToSetDataTo..".minSpeed", minSpeedToSet)
	TweakDB:SetFlat(gearToSetDataTo..".maxSpeed", maxSpeedToSet)
	TweakDB:SetFlat(gearToSetDataTo..".minEngineRPM", minEngineRPMToSet)
	TweakDB:SetFlat(gearToSetDataTo..".maxEngineRPM", maxEngineRPMToSet)
	end

	function MainFunctions.setSupensionData(VehicleDriveModelDataToSetTo, VehicleWheelSetupToSet, FrontWheelSuspensionToSet, RearWheelSuspensionToSet)
	TweakDB:SetFlat(VehicleDriveModelDataToSetTo..".wheelSetup", VehicleWheelSetupToSet)
	TweakDB:SetFlat(VehicleWheelSetupToSet..".frontPreset", FrontWheelSuspensionToSet)
	TweakDB:SetFlat(VehicleWheelSetupToSet..".backPreset", RearWheelSuspensionToSet)
	end
	
	function MainFunctions.setAllVehiclesBaseHPMult(VehicleHealthMultiplier)
		if TweakDB:GetFlat("cyberVehicleOverhaul.hasUpgradedHealth") == nil then
			
			TweakDB:SetFlat("VehicleStatPreset.BaseCar_inline0.value", TweakDB:GetFlat("VehicleStatPreset.BaseCar_inline0.value")*VehicleHealthMultiplier)
			TweakDB:SetFlat("VehicleStatPreset.BaseMotorcycle_inline0.value", TweakDB:GetFlat("VehicleStatPreset.BaseMotorcycle_inline0.value")*VehicleHealthMultiplier)
			
			TweakDB:SetFlat("cyberVehicleOverhaul.hasUpgradedHealth", true)
		end
	end
	
	function MainFunctions.setAllVehiclesVisualMult(VehicleVisualHealthMultiplier)		
		if TweakDB:GetFlat("cyberVehicleOverhaul.hasUpgraded") == nil then
		
			destructionRecords = TweakDB:GetRecords("gamedataVehicleDestruction_Record")
			
			for _, destroRecord in pairs(destructionRecords) do
				TweakDB:SetFlat(destroRecord:GetID() .. ".damageExponent", TweakDB:GetFlat(destroRecord:GetID() .. ".damageExponent") * VehicleVisualHealthMultiplier)
			end
			
			TweakDB:SetFlat("cyberVehicleOverhaul.hasUpgraded", true)
		end
	end
	
--end

return MainFunctions