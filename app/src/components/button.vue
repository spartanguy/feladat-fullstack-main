<script setup>
import { computed } from 'vue';

// Props definiálása a gomb számára
const props = defineProps({
    disabled: Boolean, 
    as: {  
        type: String,
        default: "button",
    },
    intent: { 
        type: String,
        validator: (val) => ["primary", "secondary", "danger"].includes(val),
        default: "primary",
    }
});

// Gomb osztályok dinamikus meghatározása
const buttonClass = computed(() => {
    const baseClass = "rounded-lg min-h-9 px-3 py-0.5 inline-flex items-center font-normal text-base justify-center";
    const intentClasses = {
        primary: "bg-blue-500 text-white hover:bg-blue-700",
        danger: "bg-red-600 hover:bg-red-700 text-white",
        secondary: "bg-cyan-500 text-white hover:bg-cyan-700",
    };
    return `${baseClass} ${intentClasses[props.intent] || ""}`; 
});

const emit = defineEmits(['click']);

// Kattintás eseménykezelő
const onClick = () => {
    if (!props.disabled) {
        emit('click'); 
    }
};
</script>

<template>
    <component 
      :is="props.as" 
      :class="buttonClass"
      :disabled="disabled" 
      @click="onClick">
        <slot />
    </component>
</template>

<style>
/* Letiltott gomb alapstílus */
button:disabled {
    background-color: #ccc;
}

/* Hover állapot letiltott gombnál */
button:disabled:hover {
    background-color: darkgrey;
}
</style>