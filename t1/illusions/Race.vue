<template>
  <vue-p5
          @setup="setup"
          @draw="draw"
  ></vue-p5>
</template>

<script>
  import VueP5 from 'vue-p5'
  export default {
    name: 'Race',
    components: {
      VueP5
    },
    data () {
      return {
        dx: null
      }
    },
    methods: {
      setup(s) {
        s.createCanvas(400, 330)
        s.smooth()
      },
      draw(s) {
        s.background(255)
        for (let i = 0; i < 30;i++) {
          s.noStroke()
          s.fill(0)
          s.rect(i * 20, 0, 10, s.height)
        }

        if (s.mouseIsPressed) s.background(255)

        for (let dy = 0; dy < 4; dy++) {
          if (dy % 2 == 0) s.fill('#f1c40f')
          else s.fill(0)
          s.rect(this.dx, dy * 90 + 5, 20, 50)
        }
        this.dx += 0.5
        if (this.dx > s.width + 10) this.dx = 0
      }
    }
  }
</script>

<style scoped>

</style>