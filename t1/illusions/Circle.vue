<template>
  <div>
    <vue-p5
            @draw="draw"
            @setup="setup"
    ></vue-p5>
  </div>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'Cir',
    components: {
      VueP5
    },
    methods: {
      setup (s) {
        s.createCanvas(640, 480)
      },
      draw (s) {
        if (s.mouseIsPressed) {
          s.fill(0)
        } else {
          s.fill(255)
        }
        s.ellipse(s.mouseX, s.mouseY, 80, 80)
      }
    }
  }
</script>

<style scoped>

</style>