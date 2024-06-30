extends Node3D


func _on_start_xr_xr_mode_change(blend: XRInterface.EnvironmentBlendMode) -> void:
	# Switch environment to match the new blend mode
	var env : Environment = $WorldEnvironment.environment
	match blend:
		XRInterface.XR_ENV_BLEND_MODE_OPAQUE:
			# For VR use opaque
			env.background_mode = Environment.BG_SKY
			env.ambient_light_source = Environment.AMBIENT_SOURCE_BG

		XRInterface.XR_ENV_BLEND_MODE_ALPHA_BLEND:
			# for AR-Alpha use transparent background
			env.background_mode = Environment.BG_COLOR
			env.background_color = Color(0.0, 0.0, 0.0, 0.0)
			env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR

		XRInterface.XR_ENV_BLEND_MODE_ADDITIVE:
			# For AR-Additive use black background
			env.background_mode = Environment.BG_COLOR
			env.background_color = Color(0.0, 0.0, 0.0, 0.0)
			env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR


func _on_timer_timeout() -> void:
	$Label3D.text = \
		"Frame Rate: " + str($StartXR.xr_frame_rate) + "\n" + \
		"Frame Measured: " + str(Engine.get_frames_per_second()) + "\n" + \
		"Physics Rate: " + str(Engine.physics_ticks_per_second)
