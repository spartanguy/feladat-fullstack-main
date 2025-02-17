<script setup>
import { computed } from 'vue';

const props = defineProps({
    disabled: Boolean,
    as: {
        type: String,
        default: "button",
    },
    intent: {
        type: String,
        validator: (val) => ["primary", "secondary", "danger", "good"].includes(val),
        default: "primary",
    }
});

const buttonClass = computed(() => {
    const baseClass = "rounded-lg min-h-9 px-3 py-0.5 inline-flex items-center font-normal text-base justify-center";
    const intentClasses = {
        primary: "bg-blue-500 text-white hover:bg-blue-700",
        good: "bg-green-700 hover:bg-green-800 text-white",
        danger: "bg-red-600 hover:bg-red-700 text-white",
        secondary: "bg-cyan-500 text-white hover:bg-cyan-700",
    };
    return `${baseClass} ${intentClasses[props.intent]}`;
});

const emit = defineEmits(['click']);

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
      @click="onClick"
    >
        <component 
          v-if="props.leftIcon"
          :is="props.leftIcon" 
          class="w-5 h-5" 
          :style="{ marginRight: mr }" 
        />
        <slot />
        <component 
          v-if="props.rightIcon"
          :is="props.rightIcon" 
          class="w-5 h-5" 
        />
    </component>
</template>

<style>
button:disabled {
    background-color: #ccc;
}

button:disabled:hover {
    background-color: darkgrey;
}
</style>
