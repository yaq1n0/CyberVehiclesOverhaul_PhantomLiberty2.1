ThortonMackinawPanamTweaks = { 
    description = "Thorton Mackinaw Panam Handling Mod E1"
}

local VehicleBaseFunctions = require("modules/functions/main_functions")

function ThortonMackinawPanamTweaks.new(FinalDriveMultToSet, MaxTorqueMult, BrakingTorqueMult, BrakingFrictionFactorMult, MaxWheelTurnMult, TurnMaxAddMult, TurnMaxSubMult)

	MinRPM=600
	MaxRPM=4500
	MaxTorque=1500
	ResistanceTorque=90
	WheelsResistanceRatio=15
	
	BrakingFrictionFactor=1.95
	MaxBrakingTorqueFront=4600
	MaxBrakingTorqueBack=4400
	
	FrontFrictionLateralMult=1.05
	FrontFricitionLongitudinal=1.10
	
	RearFrictionLateralMult=1.20
	RearFricitionLongitudinal=1.30
	
	TotalMass = 4117
	TurningRollFactor = 0.5
	airResistanceFactor = 2.5
	
	MaxTurnDegrees = 35
	TurnMaxAddPerSecond = 75
	TurnMaxSubPerSecond = 90
	
	--FrontVisualSuspensionDroop = 0.12
	FrontWheelsVerticalOffset = 0.03
	--RearVisualSuspensionDroop = 0.12
	RearWheelsVerticalOffset = 0.03
	
	SpringStiffnessFront = 61
	SpringStiffnessRear = 63
	
	SwaybarStiffnessFront = 2.0
	SwaybarStiffnessRear = 2.2

	FrontSpringReboundDamping = 7800
	RearSpringReboundDamping = 7500
	
	FinalDriveMult = 2.0
	GearSpeedMult = 2.0

	AmountOfGears = 6
	
	gearsTorqueMult = {}
	gearsMinSpeed = {}
	gearsMaxSpeed = {}
	gearsMinRPM = {}
	gearsMaxRPM = {}
	
	--setting '1' cuz there is gear 0
	gearsTorqueMult[1] = 0.70
	gearsMinSpeed[1] = 0*FinalDriveMult
	gearsMaxSpeed[1] = 16*FinalDriveMult
	gearsMinRPM[1] = 500
	gearsMaxRPM[1] = 3800
	
	gearsTorqueMult[2] = 0.56
	gearsMinSpeed[2] = 14*FinalDriveMult
	gearsMaxSpeed[2] = 24*FinalDriveMult
	gearsMinRPM[2] = 3500
	gearsMaxRPM[2] = 3500
	
	gearsTorqueMult[3] = 0.44
	gearsMinSpeed[3] = 22*FinalDriveMult
	gearsMaxSpeed[3] = 32*FinalDriveMult
	gearsMinRPM[3] = 3200
	gearsMaxRPM[3] = 4000
	
	gearsTorqueMult[4] = 0.36
	gearsMinSpeed[4] = 30*FinalDriveMult
	gearsMaxSpeed[4] = 40*FinalDriveMult
	gearsMinRPM[4] = 3700
	gearsMaxRPM[4] = 3700
	
	gearsTorqueMult[5] = 0.28
	gearsMinSpeed[5] = 38*FinalDriveMult
	gearsMaxSpeed[5] = 48*FinalDriveMult
	gearsMinRPM[5] = 3300
	gearsMaxRPM[5] = 4400
	
	gearsTorqueMult[6] = 0.22
	gearsMinSpeed[6] = 46*FinalDriveMult
	gearsMaxSpeed[6] = 56*FinalDriveMult
	gearsMinRPM[6] = 3300
	gearsMaxRPM[6] = 4400
	
	--Thorton Mackinaw Handling Rework
	
	--I highly suggest not adding _player etc under them, so that you can more simply use them and make it faster for cloning :)
	vehicleName = "standard3_thorton_mackinaw_nomad_panam"
	
	--Don't change this unless you want to change the way the start of the name is written, this is for your own ease of use :) 
	fullVehicleName = "Vehicle.v_"..vehicleName
	
	gearsToUse = {
	fullVehicleName.."_inline_gear0",
	fullVehicleName.."_inline_gear1",
	fullVehicleName.."_inline_gear2",
	fullVehicleName.."_inline_gear3",
	fullVehicleName.."_inline_gear4",
	fullVehicleName.."_inline_gear5",
	fullVehicleName.."_inline_gear6"
	}
	
	--Cloning
	VehicleBaseFunctions.cloneVehicleSettings(fullVehicleName, true, true, true, true, true, false)
		
	--Cloned Variable Load
	VehicleEngineData = fullVehicleName.."_full_enginedata"
	VehicleDriveModelData = fullVehicleName.."_full_vehDriveModelData"
	VehicleDataPackage = fullVehicleName.."_full_vehDataPackage"
	VehicleWheelDimensionsSetup = fullVehicleName.."_full_vehWheelDimensionsSetup"
	VehicleWheelSetup = fullVehicleName.."_full_vehWheelSetup"
	FrontWheelSuspension = fullVehicleName.."_full_vehWheelSetupFrontPreset"
	RearWheelSuspension = fullVehicleName.."_full_vehWheelSetupRearPreset"
		
	--Basic Variable Load
	--VehicleEngineData = TweakDB:GetFlat(fullVehicleName..".vehEngineData")
	--VehicleDriveModelData = TweakDB:GetFlat(fullVehicleName..".vehDriveModelData")
	--VehicleDataPackage = TweakDB:GetFlat(fullVehicleName..".vehDataPackage")
	--VehicleWheelDimensionsSetup = TweakDB:GetFlat(fullVehicleName..".vehWheelDimensionsSetup")
	--VehicleWheelSetup = TweakDB:GetFlat(VehicleDriveModelData..".wheelSetup")
	--FrontWheelSuspension = TweakDB:GetFlat(VehicleWheelSetup..".frontPreset")
	--RearWheelSuspension = TweakDB:GetFlat(VehicleWheelSetup..".backPreset")
	
	--Other Variable Load	
	--curvesPath = TweakDB:GetFlat(fullVehicleName..".curvesPath")
	
	
	--Set base
	VehicleBaseFunctions.setSupensionData(VehicleDriveModelData, VehicleWheelSetup, FrontWheelSuspension, RearWheelSuspension)
	
	--Setting the data to specified vehicles
	VehicleBaseFunctions.setVehicleSettings(fullVehicleName, VehicleEngineData, VehicleDriveModelData, VehicleDataPackage, VehicleWheelDimensionsSetup, false)
	VehicleBaseFunctions.setVehicleSettings("Vehicle.v_standard3_thorton_mackinaw_nomad_panam", VehicleEngineData, VehicleDriveModelData, VehicleDataPackage, VehicleWheelDimensionsSetup, false)
	
	--Power Settings
	TweakDB:SetFlat(VehicleEngineData..".minRPM", MinRPM)
	TweakDB:SetFlat(VehicleEngineData..".maxRPM", MaxRPM)
	TweakDB:SetFlat(VehicleEngineData..".engineMaxTorque", MaxTorque)
	TweakDB:SetFlat(VehicleEngineData..".resistanceTorque", ResistanceTorque)
	TweakDB:SetFlat(VehicleEngineData..".wheelsResistanceRatio", WheelsResistanceRatio)
	
	--Handling settings
	TweakDB:SetFlat(VehicleDriveModelData..".airResistanceFactor", airResistanceFactor)
	TweakDB:SetFlat(VehicleDriveModelData..".chassis_mass", TotalMass)
	TweakDB:SetFlat(VehicleDriveModelData..".total_mass", TotalMass)
	TweakDB:SetFlat(VehicleDriveModelData..".turningRollFactor", TurningRollFactor)
	TweakDB:SetFlat(VehicleDriveModelData..".maxWheelTurnDeg", MaxTurnDegrees)
	TweakDB:SetFlat(VehicleDriveModelData..".wheelTurnMaxAddPerSecond", TurnMaxAddPerSecond)
	TweakDB:SetFlat(VehicleDriveModelData..".wheelTurnMaxSubPerSecond", TurnMaxSubPerSecond)
	
	--Front Suspension and tires
	TweakDB:SetFlat(FrontWheelSuspension..".frictionMulLateral", FrontFrictionLateralMult)
	TweakDB:SetFlat(FrontWheelSuspension..".frictionMulLongitudinal", FrontFricitionLongitudinal)
	TweakDB:SetFlat(FrontWheelSuspension..".springStiffness", SpringStiffnessFront)
	TweakDB:SetFlat(FrontWheelSuspension..".swaybarStiffness", SwaybarStiffnessFront)
	TweakDB:SetFlat(FrontWheelSuspension..".springReboundDamping", FrontSpringReboundDamping)
	TweakDB:SetFlat(FrontWheelSuspension..".visualSuspensionDroop", FrontVisualSuspensionDroop)
	TweakDB:SetFlat(FrontWheelSuspension..".wheelsVerticalOffset", FrontWheelsVerticalOffset)
	
	--Rear Suspension and tires
	TweakDB:SetFlat(RearWheelSuspension..".frictionMulLateral", RearFrictionLateralMult)
	TweakDB:SetFlat(RearWheelSuspension..".frictionMulLongitudinal", RearFricitionLongitudinal)
	TweakDB:SetFlat(RearWheelSuspension..".springStiffness", SpringStiffnessRear)
	TweakDB:SetFlat(RearWheelSuspension..".swaybarStiffness", SwaybarStiffnessRear)
	TweakDB:SetFlat(RearWheelSuspension..".springReboundDamping", RearSpringReboundDamping)
	TweakDB:SetFlat(RearWheelSuspension..".visualSuspensionDroop", RearVisualSuspensionDroop)
	TweakDB:SetFlat(RearWheelSuspension..".wheelsVerticalOffset", RearWheelsVerticalOffset)
	
	--Brakes
	TweakDB:SetFlat(VehicleDriveModelData..".brakingFrictionFactor", BrakingFrictionFactor)
	TweakDB:SetFlat(FrontWheelSuspension..".maxBrakingTorque", MaxBrakingTorqueFront)
	TweakDB:SetFlat(RearWheelSuspension..".maxBrakingTorque", MaxBrakingTorqueBack)
	
	--Gears settings
	
	--Gear Cloning
	GearsData = TweakDB:GetFlat(VehicleEngineData..".gears")
	for index=0,AmountOfGears do 
	TweakDB:CloneRecord(fullVehicleName.."_inline_gear"..index, GearsData[1])
	end
	
	--Gear Settings
	TweakDB:SetFlat(VehicleEngineData..".gears", gearsToUse)
	for index=1,AmountOfGears do 
	VehicleBaseFunctions.setGearData(fullVehicleName.."_inline_gear"..index, gearsTorqueMult[index], gearsMinSpeed[index], gearsMaxSpeed[index], gearsMinRPM[index], gearsMaxRPM[index])
	end

end

return ThortonMackinawNomadTweaks
