QuadraTurboRHandlingModE1 = { 
    description = "Quadra Turbo-R Handling Mod E1"
}

local VehicleBaseFunctions = require("modules/functions/main_functions")

function QuadraTurboRHandlingModE1.new(FinalDriveMultToSet, MaxTorqueMult, BrakingTorqueMult, BrakingFrictionFactorMult, MaxWheelTurnMult, TurnMaxAddMult, TurnMaxSubMult)

	MinRPM=1500
	MaxRPM=7800
	MaxTorque=800*MaxTorqueMult
	ResistanceTorque=250
	WheelsResistanceRatio=15
	
	airResistanceFactor = 1.25
	TurningRollFactor = 0.35
	TotalMass = 1900
	
	MaxWheelTurnDeg = 45*MaxWheelTurnMult
	TurnMaxAddPerSecond = 80*TurnMaxAddMult
	TurnMaxSubPerSecond = 140*TurnMaxSubMult
	
	BrakingFrictionFactor=1.35*BrakingFrictionFactorMult
	MaxBrakingTorqueFront=2575*BrakingTorqueMult
	MaxBrakingTorqueBack=3400*BrakingTorqueMult
	
	FrontFrictionLateralMult=1.09
	FrontFricitionLongitudinal=1.10
	
	RearFrictionLateralMult=1.10
	RearFricitionLongitudinal=1.10
	
	FrontVisualSuspensionCompressionLength = 0.005
	FrontVisualSuspensionDroop = 0.11
	FrontWheelsVerticalOffset = 0.02
	
	RearVisualSuspensionCompressionLength = 0.01
	RearVisualSuspensionDroop = 0.11
	RearWheelsVerticalOffset = 0.02
	
	FrontExtremeCompressionEventScale = 0.2
	RearExtremeCompressionEventScale = 0.2
		
	SpringStiffnessFront = 20
	SpringStiffnessRear = 26
	
	SwaybarStiffnessFront = 20
	SwaybarStiffnessRear = 17
	
	FrontSuspensionWeight = 60
	RearSuspensionWeight = 20
	
	AmountOfGears = 7
	
	gearsTorqueMult = {}
	gearsMinSpeed = {}
	gearsMaxSpeed = {}
	gearsMinRPM = {}
	gearsMaxRPM = {}
	
	--setting '1' cuz there is gear 0
	gearsTorqueMult[1] = 1
	gearsMinSpeed[1] = -2*FinalDriveMultToSet
	gearsMaxSpeed[1] = 20*FinalDriveMultToSet
	gearsMinRPM[1] = 1550
	gearsMaxRPM[1] = 6800
	
	gearsTorqueMult[2] = 0.44
	gearsMinSpeed[2] = 15.75*FinalDriveMultToSet
	gearsMaxSpeed[2] = 26.25*FinalDriveMultToSet
	gearsMinRPM[2] = 4000
	gearsMaxRPM[2] = 6200
	
	gearsTorqueMult[3] = 0.40
	gearsMinSpeed[3] = 23*FinalDriveMultToSet
	gearsMaxSpeed[3] = 33.5*FinalDriveMultToSet
	gearsMinRPM[3] = 4000
	gearsMaxRPM[3] = 6600
	
	gearsTorqueMult[4] = 0.34
	gearsMinSpeed[4] = 30.5*FinalDriveMultToSet
	gearsMaxSpeed[4] = 40*FinalDriveMultToSet
	gearsMinRPM[4] = 4100
	gearsMaxRPM[4] = 6800
	
	gearsTorqueMult[5] = 0.29
	gearsMinSpeed[5] = 36.75*FinalDriveMultToSet
	gearsMaxSpeed[5] = 47.25*FinalDriveMultToSet
	gearsMinRPM[5] = 4200
	gearsMaxRPM[5] = 6900
	
	gearsTorqueMult[6] = 0.27
	gearsMinSpeed[6] = 44.5*FinalDriveMultToSet
	gearsMaxSpeed[6] = 52.5*FinalDriveMultToSet
	gearsMinRPM[6] = 4300
	gearsMaxRPM[6] = 7000
	
	gearsTorqueMult[7] = 0.26
	gearsMinSpeed[7] = 48.8*FinalDriveMultToSet
	gearsMaxSpeed[7] = 60*FinalDriveMultToSet
	gearsMinRPM[7] = 4400
	gearsMaxRPM[7] = 7800
	
	--Reverse
	gearsTorqueMult[8] = 1
	gearsMinSpeed[8] = -2*FinalDriveMultToSet
	gearsMaxSpeed[8] = 16*FinalDriveMultToSet
	gearsMinRPM[8] = 1550
	gearsMaxRPM[8] = 6800
	
	--Turbo R V-tech Rework

	--I highly suggest not adding _player etc under them, so that you can more simply use them and make it faster for cloning :)
	vehicleName = "sport1_quadra_turbo_r"
	
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
	VehicleBaseFunctions.setVehicleSettings("Vehicle.v_sport1_quadra_turbo_r_player", VehicleEngineData, VehicleDriveModelData, VehicleDataPackage, VehicleWheelDimensionsSetup, false)
	
	--Power Settings
	TweakDB:SetFlat(VehicleEngineData..".minRPM", MinRPM)
	TweakDB:SetFlat(VehicleEngineData..".maxRPM", MaxRPM)
	TweakDB:SetFlat(VehicleEngineData..".engineMaxTorque", MaxTorque)
	TweakDB:SetFlat(VehicleEngineData..".resistanceTorque", ResistanceTorque)
	TweakDB:SetFlat(VehicleEngineData..".wheelsResistanceRatio", WheelsResistanceRatio)
	
	--Front Suspension and tires
	TweakDB:SetFlat(FrontWheelSuspension..".frictionMulLateral", FrontFrictionLateralMult)
	TweakDB:SetFlat(FrontWheelSuspension..".frictionMulLongitudinal", FrontFricitionLongitudinal)
	TweakDB:SetFlat(FrontWheelSuspension..".springStiffness", SpringStiffnessFront)
	TweakDB:SetFlat(FrontWheelSuspension..".visualSuspensionCompressionLength", FrontVisualSuspensionCompressionLength)
	TweakDB:SetFlat(FrontWheelSuspension..".visualSuspensionDroop", FrontVisualSuspensionDroop)
	TweakDB:SetFlat(FrontWheelSuspension..".wheelsVerticalOffset", FrontWheelsVerticalOffset)
	TweakDB:SetFlat(FrontWheelSuspension..".extremeCompressionEventScalor", FrontExtremeCompressionEventScale)
	TweakDB:SetFlat(FrontWheelSuspension..".mass", FrontSuspensionWeight)
	
	--Rear Suspension and tires
	TweakDB:SetFlat(RearWheelSuspension..".frictionMulLateral", RearFrictionLateralMult)
	TweakDB:SetFlat(RearWheelSuspension..".frictionMulLongitudinal", RearFricitionLongitudinal)
	TweakDB:SetFlat(RearWheelSuspension..".springStiffness", SpringStiffnessRear)
	TweakDB:SetFlat(RearWheelSuspension..".visualSuspensionCompressionLength", RearVisualSuspensionCompressionLength)
	TweakDB:SetFlat(RearWheelSuspension..".visualSuspensionDroop", RearVisualSuspensionDroop)
	TweakDB:SetFlat(RearWheelSuspension..".wheelsVerticalOffset", RearWheelsVerticalOffset)
	TweakDB:SetFlat(RearWheelSuspension..".extremeCompressionEventScalor", RearExtremeCompressionEventScale)
	TweakDB:SetFlat(RearWheelSuspension..".mass", RearSuspensionWeight)
	
	--Handling settings
	TweakDB:SetFlat(VehicleDriveModelData..".airResistanceFactor", airResistanceFactor)
	TweakDB:SetFlat(VehicleDriveModelData..".chassis_mass", TotalMass)
	TweakDB:SetFlat(VehicleDriveModelData..".total_mass", TotalMass)
	TweakDB:SetFlat(VehicleDriveModelData..".turningRollFactor", TurningRollFactor)
	TweakDB:SetFlat(VehicleDriveModelData..".maxWheelTurnDeg", MaxWheelTurnDeg)
	TweakDB:SetFlat(VehicleDriveModelData..".wheelTurnMaxAddPerSecond", TurnMaxAddPerSecond)
	TweakDB:SetFlat(VehicleDriveModelData..".wheelTurnMaxSubPerSecond", TurnMaxSubPerSecond)
	
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
	
	-- Specific for Reverse:
	VehicleBaseFunctions.setGearData(fullVehicleName.."_inline_gear"..0, gearsTorqueMult[8], gearsMinSpeed[8], gearsMaxSpeed[8], gearsMinRPM[8], gearsMaxRPM[8])
	
	for index=1,AmountOfGears do 
	VehicleBaseFunctions.setGearData(fullVehicleName.."_inline_gear"..index, gearsTorqueMult[index], gearsMinSpeed[index], gearsMaxSpeed[index], gearsMinRPM[index], gearsMaxRPM[index])
	end

end

return QuadraTurboRHandlingModE1
