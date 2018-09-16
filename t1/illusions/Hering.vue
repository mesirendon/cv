<template>
  <div>
    <vue-p5
            @setup="setup"
            @draw="draw"
            @mousepressed="mousePressed"
            @mousereleased="mouseReleased"
    ></vue-p5>
  </div>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'Hering',
    components: {
      VueP5
    },
    data () {
      return {
        red: 255,
        green: 255,
        blue: 255
      }
    },
    methods: {
      setup (s) {
        s.createCanvas(500, 500)
      },
      draw (s) {
        const {red, green, blue} = this
        s.background(red, green, blue)
        s.translate(250, 250)
        s.strokeWeight(1)
        s.stroke(0, 0, 255)
        for (let i = 0; i < 490; i = i + 10) {
          s.rotate(5)
          s.line(0, 0, 400, 400)
        }
        s.strokeWeight(2)
        s.stroke(255, 0, 0)
        s.rotate(-245)
        s.translate(-250, -250)
        s.line(200, 0, 200, 500)
        s.line(300, 0, 300, 500)
      },
      mousePressed (s) {
        this.red = 0
        this.green = 0
      },
      mouseReleased (s) {
        this.red = 255
        this.green = 255
      }
    }
  }
</script>

<style scoped>

</style>