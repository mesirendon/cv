<template>
  <vue-p5 @setup="setup" @mousepressed="mousePressed"></vue-p5>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'Dots',
    components: {
      VueP5
    },
    data () {
      return {
        state: 0
      }
    },
    methods: {
      setup (s) {
        s.createCanvas(450, 450)
        s.background(0)
      },
      mousePressed (s) {
        if (this.state == 0) {
          let colorValue = 255
          s.fill(colorValue)
          s.ellipse(150, 150, 80, 80)
          s.ellipse(300, 300, 80, 80)
          colorValue = 0
          s.fill(colorValue)
          s.ellipse(300, 150, 80, 80)
          s.ellipse(150, 300, 80, 80)
          this.state = 1
        } else {
          let colorValue = 0
          s.fill(colorValue)
          s.ellipse(150, 150, 80, 80)
          s.ellipse(300, 300, 80, 80)
          colorValue = 255
          s.fill(colorValue)
          s.ellipse(300, 150, 80, 80)
          s.ellipse(150, 300, 80, 80)
          this.state = 0
        }
      }
    }
  }
</script>

<style scoped>

</style>