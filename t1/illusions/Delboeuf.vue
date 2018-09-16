<template>
  <vue-p5 @setup="setup"></vue-p5>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'Delboeuf',
    components: {
      VueP5
    },
    methods: {
      setup (s) {
        s.createCanvas(800, 400)
        s.stroke(0, 100, 0)
        s.strokeWeight(5)
        s.ellipse(480, 240, 210, 210)
        s.ellipse(240, 240, 120, 120)
        s.fill(0, 100, 0)
        s.ellipse(240, 240, 80, 80)
        s.ellipse(480, 240, 80, 80)
      }
    }
  }
</script>

<style scoped>

</style>