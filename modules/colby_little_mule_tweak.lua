ColbyLittleMuleHandlingTweaksE1 = { 
    description = "Colby Little Mule Handling Tweaks"
}
local VehicleBaseFunctions = require("modules/functions/main_functions")

function ColbyLittleMuleHandlingTweaksE1.new(FinalDriveMultToSet, MaxTorqueMult, BrakingTorqueMult, BrakingFrictionFactorMult, MaxWheelTurnMult, TurnMaxAddMult, TurnMaxSubMult)
	
	MinRPM=800
	MaxRPM=7100
	MaxTorque=650*MaxTorqueMult
	ResistanceTorque=70
	WheelsResistanceRatio=15
	
	BrakingFrictionFactor=1.75*BrakingFrictionFactorMult
	MaxBrakingTorqueFront=3000*BrakingTorqueMult
	MaxBrakingTorqueBack=3000*BrakingTorqueMult
	
	airResistanceFactor = 1.4
	TurningRollFactor = 0.45
	TotalMass = 1700
	
	MaxWheelTurnDeg = 45*MaxWheelTurnMult
	TurnMaxAddPerSecond = 100*TurnMaxAddMult
	TurnMaxSubPerSecond = 150*TurnMaxSubMult
	
	FrontFrictionLateralMult=0.95
	FrontFricitionLongitudinal=0.99
	
	RearFrictionLateralMult=1.05
	RearFricitionLongitudinal=0.99
	
	FrontLogicalSuspensionCompressionLength = 0.4
	FrontVisualSuspensionCompressionLength = 0.15
	FrontVisualSuspensionDroop = -0.05
	FrontWheelsVerticalOffset = 0.25
	
	RearLogicalSuspensionCompressionLength = 0.4
	RearVisualSuspensionCompressionLength = 0.15
	RearVisualSuspensionDroop = -0.05
	RearWheelsVerticalOffset = 0.25
	
	SpringStiffnessFront = 16
	SpringStiffnessRear = 15
	
	FrontSpringReboundDamping = 4000.001
	RearSpringReboundDamping = 4000.001
	
	AmountOfGears = 7
	
	gearsTorqueMult = {}
	gearsMinSpeed = {}
	gearsMaxSpeed = {}
	gearsMinRPM = {}
	gearsMaxRPM = {}
	
	--setting '1' cuz there is gear 0
	gearsTorqueMult[1] = 1
	gearsMinSpeed[1] = 0*FinalDriveMultToSet
	gearsMaxSpeed[1] = 14*FinalDriveMultToSet
	gearsMinRPM[1] = 700
	gearsMaxRPM[1] = 6400
	
	gearsTorqueMult[2] = 0.75
	gearsMinSpeed[2] = 13*FinalDriveMultToSet
	gearsMaxSpeed[2] = 21*FinalDriveMultToSet
	gearsMinRPM[2] = 3300
	gearsMaxRPM[2] = 6400
	
	gearsTorqueMult[3] = 0.48
	gearsMinSpeed[3] = 20*FinalDriveMultToSet
	gearsMaxSpeed[3] = 27*FinalDriveMultToSet
	gearsMinRPM[3] = 3400
	gearsMaxRPM[3] = 6400
	
	gearsTorqueMult[4] = 0.34
	gearsMinSpeed[4] = 26*FinalDriveMultToSet
	gearsMaxSpeed[4] = 32*FinalDriveMultToSet
	gearsMinRPM[4] = 3500
	gearsMaxRPM[4] = 6400
	
	gearsTorqueMult[5] = 0.30
	gearsMinSpeed[5] = 31*FinalDriveMultToSet
	gearsMaxSpeed[5] = 35.3*FinalDriveMultToSet
	gearsMinRPM[5] = 3700
	gearsMaxRPM[5] = 6200
	
	gearsTorqueMult[6] = 0.27
	gearsMinSpeed[6] = 33.5*FinalDriveMultToSet
	gearsMaxSpeed[6] = 38*FinalDriveMultToSet
	gearsMinRPM[6] = 3900
	gearsMaxRPM[6] = 6000
	
	gearsTorqueMult[7] = 0.25
	gearsMinSpeed[7] = 35.5*FinalDriveMultToSet
	gearsMaxSpeed[7] = 42.5*FinalDriveMultToSet
	gearsMinRPM[7] = 4000
	gearsMaxRPM[7] = 7100
	
	--I highly suggest not adding _player etc under them, so that you can more simply use them and make it faster for cloning :)
	vehicleName = "standard25_thorton_colby_nomad"
	
	--Don't change this unless you want to change the way the start of the name is written, this is for your own ease of use :) 
	fullVehicleName = "Vehicle.v_"..vehicleName
	
	gearsToUse = {
	fullVehicleName.."_inline_gear0",
	fullVehicleName.."_inline_gear1",
	fullVehicleName.."_inline_gear2",
	fullVehicleName.."_inline_gear3",
	fullVehicleName.."_inline_gear4",
	fullVehicleName.."_inline_gear5",
	fullVehicleName.."_inline_gear6",
	fullVehicleName.."_inline_gear7"
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
	--VehicleBaseFunctions.setVehicleSettings("Vehicle.q114_thorton_colby_nomad", VehicleEngineData, VehicleDriveModelData, VehicleDataPackage, VehicleWheelDimensionsSetup, false)
	VehicleBaseFunctions.setVehicleSettings("Vehicle.v_standard25_thorton_colby_nomad", VehicleEngineData, VehicleDriveModelData, VehicleDataPackage, VehicleWheelDimensionsSetup, false)
	VehicleBaseFunctions.setVehicleSettings("Vehicle.v_standard25_thorton_colby_nomad_ncu", VehicleEngineData, VehicleDriveModelData, VehicleDataPackage, VehicleWheelDimensionsSetup, false)
	VehicleBaseFunctions.setVehicleSettings("Vehicle.v_standard25_thorton_colby_nomad_player", VehicleEngineData, VehicleDriveModelData, VehicleDataPackage, VehicleWheelDimensionsSetup, false)
	VehicleBaseFunctions.setVehicleSettings("Vehicle.v_standard25_thorton_colby_nomad_quest", VehicleEngineData, VehicleDriveModelData, VehicleDataPackage, VehicleWheelDimensionsSetup, false)
	VehicleBaseFunctions.setVehicleSettings("Vehicle.v_standard25_thorton_colby_nomad_wraith", VehicleEngineData, VehicleDriveModelData, VehicleDataPackage, VehicleWheelDimensionsSetup, false)

	
	--Power Settings
	TweakDB:SetFlat(VehicleEngineData..".minRPM", MinRPM)
	TweakDB:SetFlat(VehicleEngineData..".maxRPM", MaxRPM)
	TweakDB:SetFlat(VehicleEngineData..".engineMaxTorque", MaxTorque)
	TweakDB:SetFlat(VehicleEngineData..".resistanceTorque", ResistanceTorque)
	TweakDB:SetFlat(VehicleEngineData..".wheelsResistanceRatio", WheelsResistanceRatio)
	
	--Handling settings
	TweakDB:SetFlat(VehicleDriveModelData..".airResistanceFactor", airResistanceFactor)
	TweakDB:SetFlat(VehicleDriveModelData..".chassis_mass", TotalMass)
	TweakDB:SetFlat(VehicleDriveModelData..".turningRollFactor", TurningRollFactor)
	TweakDB:SetFlat(VehicleDriveModelData..".maxWheelTurnDeg", MaxWheelTurnDeg)
	TweakDB:SetFlat(VehicleDriveModelData..".wheelTurnMaxAddPerSecond", TurnMaxAddPerSecond)
	TweakDB:SetFlat(VehicleDriveModelData..".wheelTurnMaxSubPerSecond", TurnMaxSubPerSecond)
	
	--Front Suspension and tires
	TweakDB:SetFlat(FrontWheelSuspension..".frictionMulLateral", FrontFrictionLateralMult)
	TweakDB:SetFlat(FrontWheelSuspension..".frictionMulLongitudinal", FrontFricitionLongitudinal)
	TweakDB:SetFlat(FrontWheelSuspension..".springStiffness", SpringStiffnessFront)
	TweakDB:SetFlat(FrontWheelSuspension..".visualSuspensionDroop", FrontVisualSuspensionDroop)
	TweakDB:SetFlat(FrontWheelSuspension..".wheelsVerticalOffset", FrontWheelsVerticalOffset)
	TweakDB:SetFlat(FrontWheelSuspension..".springReboundDamping", FrontSpringReboundDamping)
	TweakDB:SetFlat(FrontWheelSuspension..".visualSuspensionCompressionLength", FrontVisualSuspensionCompressionLength)
	TweakDB:SetFlat(FrontWheelSuspension..".logicalSuspensionCompressionLength", FrontLogicalSuspensionCompressionLength)

	
	--Rear Suspension and tires
	TweakDB:SetFlat(RearWheelSuspension..".frictionMulLateral", RearFrictionLateralMult)
	TweakDB:SetFlat(RearWheelSuspension..".frictionMulLongitudinal", RearFricitionLongitudinal)
	TweakDB:SetFlat(RearWheelSuspension..".springStiffness", SpringStiffnessRear)
	TweakDB:SetFlat(RearWheelSuspension..".visualSuspensionDroop", RearVisualSuspensionDroop)
	TweakDB:SetFlat(RearWheelSuspension..".wheelsVerticalOffset", RearWheelsVerticalOffset)
	TweakDB:SetFlat(RearWheelSuspension..".springReboundDamping", RearSpringReboundDamping)
	TweakDB:SetFlat(RearWheelSuspension..".visualSuspensionCompressionLength", RearVisualSuspensionCompressionLength)
	TweakDB:SetFlat(RearWheelSuspension..".logicalSuspensionCompressionLength", RearLogicalSuspensionCompressionLength)
	
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

return ColbyLittleMuleHandlingTweaksE1
