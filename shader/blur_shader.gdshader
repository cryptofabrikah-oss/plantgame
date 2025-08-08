shader_type canvas_item;

// uniform float blur_amount : hint_range(1.0, 8.0) = 3.0;  // Remove essa linha

void fragment() {
    ivec2 tex_size_int = textureSize(TEXTURE, 0);
    vec2 size = vec2(tex_size_int);
    vec4 sum = vec4(0.0);

    int passes = 5;  // valor fixo para o blur_amount

    for (int x = -passes; x <= passes; x++) {
        for (int y = -passes; y <= passes; y++) {
            sum += texture(TEXTURE, UV + vec2(float(x), float(y)) / size);
        }
    }
    float kernel_size = float(passes * 2 + 1);
    COLOR = sum / (kernel_size * kernel_size);
}