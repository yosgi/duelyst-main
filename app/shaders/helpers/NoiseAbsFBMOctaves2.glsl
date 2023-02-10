#pragma glslify: getNoise3D = require(./Noise3D.glsl)

float getNoiseAbsFBMOctaves2(in vec3 v) {
	float res = 0.0;
	float scale = 1.0;
	for(int i=0; i<2; i++) {
		res += abs(getNoise3D(v)) * scale;
		v *= vec3(2.0, 2.0, 2.0);
		scale *= 0.5;
	}
	return res;
}

#pragma glslify: export(getNoiseAbsFBMOctaves2)
