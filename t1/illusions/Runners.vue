<template>
  <vue-p5 @setup="setup" @draw="draw"></vue-p5>
</template>

<script>
  import VueP5 from 'vue-p5'

  export default {
    name: 'Runners',
    components: {
      VueP5
    },
    data () {
      return {
        img: null
      }
    },
    methods: {
      setup (s) {
        s.createCanvas(500, 500)
        s.background(200)
        s.rect(260, 200, 90, 90)
        s.line(0, 0, 260, 200)
        s.line(80, 0, 275, 200)
        s.line(160, 0, 290, 200)
        s.line(240, 0, 305, 200)
        s.line(320, 0, 320, 200)
        s.line(400, 0, 335, 200)
        s.line(480, 0, 350, 200)
        s.line(350, 215, 680, 0)
        s.line(350, 230, 1280, 0)
        s.line(350, 245, 1040, 280)
        s.line(350, 260, 840, 500)
        s.line(350, 275, 620, 500)
        s.line(0, 80, 260, 215)
        s.line(0, 160, 260, 230)
        s.line(0, 240, 260, 245)
        s.line(0, 320, 260, 260)
        s.line(0, 400, 260, 275)
        s.line(0, 480, 260, 290)
        s.line(350, 290, 500, 500)
        s.line(233, 310, 363, 310)
        s.line(178, 350, 392, 350)
        s.line(123, 390, 420, 390)
        s.line(70, 430, 450, 430)
        s.line(16, 468, 478, 470)
        this.img = s.loadImage('https://image.flaticon.com/icons/png/128/10/10525.png')
      },
      draw (s) {
        s.image(this.img, 300, 260, 50, 50)
        s.image(this.img, 200, 360)
      }
    }
  }
</script>

<style scoped>

</style>