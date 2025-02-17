<script setup>
const emit = defineEmits(["search"])

const search =(e) => {
    emit("search", e.target.value)
}
</script>

<template>
    <!--Kereső mező-->
    <form class="py-3 items-center grid md:grid-cols-12 lg:grid-cols-12 grid-cols-1 ">
        <label class="sr-only">Keresés</label>
        <div class="relative col-span-1 md:col-span-4 lg:col-span-3 bg-white">
            <input style="width: 100%" type="text" @input="search" placeholder="Keresés" class="block rounded-md border-0 py-2 px-2 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
        </div>
    </form>
</template>

<style>
</style>