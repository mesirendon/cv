<template>
  <vue-p5 @setup="setup"></vue-p5>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'Grid',
    components: {
      VueP5
    },
    methods: {
      setup (s) {
        s.createCanvas(600, 600)
        s.fill(0, 0, 0)
        let size = 40
        for (let i = 0; i <= 10; i++) {
          s.rect(size, 40, 40, 40)
          let size2 = 40
          for (var j = 0; j <= 10; j++) {
            s.rect(size, size2, 40, 40)
            size2 += 50
          }
          size += 50
        }
      }
    }
  }
</script>

<style scoped>

</style>