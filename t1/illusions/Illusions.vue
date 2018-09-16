<template>
  <div>
    <form @submit.prevent>
      <select name="illusions" id="illusions" v-model="illusion">
        <option v-for="illusion in illusions" :value="illusion.code">{{illusion.name}}</option>
      </select>
    </form>
    <div id="hering" v-if="illusion == 'hering'">
      <h4>Hering Illusion</h4>
      <hering></hering>
      <blockquote class="blockquote">
        <p class="mb-0">"The Hering illusion is one of the geometrical-optical illusions and was discovered by the
          German
          physiologist
          Ewald Hering in 1861. When two straight and parallel lines are presented in front of radial background
          (like
          the spokes of a bicycle), the lines appear as if they were bowed outwards. The Orbison illusion is one of its
          variants, while the Wundt illusion produces a similar, but inverted effect."</p>
        <footer class="blockquote-footer">Hering ilussion at <cite title="Wikipedia"><a
                href="https://en.wikipedia.org/wiki/Hering_illusion" target="_blank">Wikipedia</a></cite></footer>
      </blockquote>
    </div>
    <div id="homer" v-if="illusion == 'homer'">
      <h4>Negative After Image</h4>
      <homer></homer>
      <blockquote class="blockquote">
        <p class="mb-0">An experience of an afterimage is caused by a previously seen stimulus, when that stimulus
          itself is no longer present.</p>
        <p class="mb-0">Negative afterimages exhibit inverted lightness levels, or colours complementary to, those of
          the stimulus and are usually brought on by prolonged viewing of a stimulus. They are best seen against a
          brightly light background. They occur (as least in part) because some cells (cones) on the retina do not
          respond to the present stimulation because they have been desensitised by looking at a previous stimulus.</p>
        <footer class="blockquote-footer">Footsteps at <cite title="Stuart Anstis Lab"><a
                href="https://www.illusionsindex.org/ir/negative-afterimages"
                target="_blank">The Illusions Index</a></cite></footer>
      </blockquote>
    </div>
    <div id="race" v-if="illusion == 'race'">
      <h4>Stuart Anstis</h4>
      <race></race>
      <blockquote class="blockquote">
        <p class="mb-0">"The blue [black in our case] and yellow squares move exactly in step. But when the background
          is striped they seem
          to speed up and slow down in alternation. Reason: when the leading & trailing edges of the dark blue square
          lie on the black stripes, their contrast is low so the motion looks slower (Pete Thompson 1976). On the white
          stripes the edges have high contrast so the motion seems to speed up. The opposite is true for the light
          yellow squares. Maybe this is like cars that appear to go slower in the fog."</p>
        <footer class="blockquote-footer">Negative Afterimages at <cite title="Stuart Anstis Lab"><a
                href="http://anstislab.ucsd.edu/2012/11/19/footsteps/"
                target="_blank">Stuart Anstis Lab</a></cite></footer>
      </blockquote>
    </div>
    <div id="blivet" v-if="illusion == 'blivet'">
      <h4>Blivet</h4>
      <blivet></blivet>
      <blockquote class="blockquote">
        <p class="mb-0">"An impossible trident, also known as an impossible fork, a blivet, poiuyt, devil's
          tuning fork, etc., is a drawing of an impossible object (undecipherable figure), a kind of an optical
          illusion. It appears to have three cylindrical prongs at one end which then mysteriously transform into two
          rectangular prongs at the other end."</p>
        <footer class="blockquote-footer">Impossible trident at <cite title="Wikipedia"><a
                href="https://en.wikipedia.org/wiki/Impossible_trident" target="_blank">Wikipedia</a></cite></footer>
      </blockquote>
    </div>
    <div id="hermann" v-if="illusion == 'hermann'">
      <h4>Grid Effect (Hermann)</h4>
      <grid></grid>
      <blockquote class="blockquote">
        <p class="mb-0">"The Hermann grid is a classic example of what vision scientists call a simultaneous lightness
          contrast illusion, but philosophers have pointed out that it is not clear whether to best classify it as an
          illusion or as a kind of hallucination (Byrne 2011; Macpherson 2013). The question is whether we are
          inaccurately perceiving the white intersections as grey (and so undergoing an illusion), or whether we are
          hallucinating the appearance of non-existent grey smudges or dots."</p>
        <footer class="blockquote-footer">Hermann Grid at <cite title="The Illusions Index"><a
                href="https://www.illusionsindex.org/i/hermann-grid" target="_blank">The Illusions
          Index</a></cite></footer>
      </blockquote>
    </div>
    <div id="dots" v-if="illusion == 'dots'">
      <h4>Stroboscopic motion</h4>
      <dots></dots>
      <blockquote class="blockquote">
        <p class="mb-0">"Basically, when there's a strobing motion of light, it can trick your eye into thinking
          something is moving backward or not be moving at all when it may just be moving normally."</p>
        <footer class="blockquote-footer">People say this optical illusion with 2 dots is blowing their minds — what do
          you see? at <cite title="insider"><a
                  href="https://www.thisisinsider.com/optical-illusion-four-dots-2018-1"
                  target="_blank">Insider</a></cite></footer>
      </blockquote>
    </div>
    <div id="runners" v-if="illusion == 'runners'">
      <h4>Perspective Room</h4>
      <runners></runners>
      <blockquote class="blockquote">
        <p class="mb-0">"Forced perspective is a technique which employs optical illusion to make an object appear
          farther away, closer, larger or smaller than it actually is. It manipulates human visual perception through
          the use of scaled objects and the correlation between them and the vantage point of the spectator or camera.
          It has applications in photography, filmmaking and architecture."</p>
        <footer class="blockquote-footer">Forced perspective at <cite title="Wikipedia"><a
                href="https://en.wikipedia.org/wiki/Forced_perspective" target="_blank">Wikipedia</a></cite></footer>
      </blockquote>
    </div>
    <div id="square" v-if="illusion == 'square'">
      <h4>Illusory contours</h4>
      <square></square>
      <blockquote class="blockquote">
        <p class="mb-0">"Illusory contours or subjective contours are visual illusions that evoke the perception of an
          edge without a luminance or color change across that edge. Illusory brightness and depth ordering frequently
          accompany illusory contours. Friedrich Schumann is often credited with the discovery of illusory contours
          around the beginning of the twentieth century, however illusory contours are present in art dating to the
          Middle Ages. Gaetano Kanizsa’s 1976 Scientific American paper marks the resurgence of interest in illusory
          contours for vision scientists. "</p>
        <footer class="blockquote-footer">Illusory contours at <cite title="Wikipedia"><a
                href="https://en.wikipedia.org/wiki/Illusory_contours" target="_blank">Wikipedia</a></cite></footer>
      </blockquote>
    </div>
    <div id="arrows" v-if="illusion == 'arrows'">
      <h4>Muller-Lyer</h4>
      <arrows></arrows>
      <blockquote class="blockquote">
        <p class="mb-0">"The classical explanation for the Müller-Lyer illusion is that the outward-pointing figure is
          perceived as longer because it is also perceived as further away (Gregory, 1968)."</p>
        <footer class="blockquote-footer">Culture and Perception, part II: The Muller-Lyer illusion at <cite
                title="International Cognition & Culture Institute"><a
                href="https://en.wikipedia.org/wiki/Forced_perspective" target="_blank">International Cognition &
          Culture Institute</a></cite></footer>
      </blockquote>
    </div>
    <div id="bar" v-if="illusion == 'bar'">
      <h4>Simultaneous Contrast Illusion</h4>
      <bar></bar>
      <blockquote class="blockquote">
        <p class="mb-0">"Color constancy is an example of subjective constancy and a feature of the human color
          perception system which ensures that the perceived color of objects remains relatively constant under varying
          illumination conditions. A green apple for instance looks green to us at midday, when the main illumination is
          white sunlight, and also at sunset, when the main illumination is red. This helps us identify objects."</p>
        <footer class="blockquote-footer">Color constancy at <cite title="Wikipedia"><a
                href="https://en.wikipedia.org/wiki/Color_constancy" target="_blank">Wikipedia</a></cite></footer>
      </blockquote>
    </div>
    <div id="delboeuf" v-if="illusion == 'delboeuf'">
      <h4>Delboeuf</h4>
      <delboeuf></delboeuf>
      <blockquote class="blockquote">
        <p class="mb-0">"The Delboeuf illusion is an optical illusion of relative size perception. In the best-known
          version of the illusion, two circles of identical size have been placed near to each other and one is
          surrounded by an annulus; the surrounded circle then appears larger than the non-surrounded circle if the
          annulus is close, while appearing smaller than the non-surrounded circle if the annulus is distant. A 2005
          study suggests it is caused by the same visual processes that cause the Ebbinghaus illusion."</p>
        <footer class="blockquote-footer">Delboeuf illusion at <cite title="Wikipedia"><a
                href="https://en.wikipedia.org/wiki/Delboeuf_illusion" target="_blank">Wikipedia</a></cite></footer>
      </blockquote>
    </div>
    <div id="cafe" v-if="illusion == 'cafe'">
      <h4>Cafe Wall</h4>
      <cafe-wall></cafe-wall>
      <blockquote class="blockquote">
        <p class="mb-0">"This illusion is interesting because it is relevant to debates about modularity, cognitive
          penetration, and the nature of experience. To explain: on the hypothesis that the mind is modular, a mental
          module is a kind of semi-independent department of the mind which deals with particular types of inputs, and
          gives particular types of outputs, and whose inner workings are not accessible to the conscious awareness of
          the person – all one can get access to are the relevant outputs. So, in the case of the Café Wall Illusion, a
          standard way of explaining why experience of the illusion persists even though one knows that one is
          experiencing an illusion is that the module, or modules, which constitute the visual system are ‘cognitively
          impenetrable’ to some degree – i.e. their inner workings and outputs cannot be influenced by conscious
          awareness."</p>
        <footer class="blockquote-footer">Café Wall Illusion at <cite title="The Illusions Index"><a
                href="https://www.illusionsindex.org/i/cafe-wall-illusion" target="_blank">The Illusions
          Index</a></cite></footer>
      </blockquote>
    </div>
    <div id="ebbinghaus" v-if="illusion == 'ebbinghaus'">
      <h4>Ebbinghaus</h4>
      <ebbinghaus></ebbinghaus>
      <blockquote class="blockquote">
        <p class="mb-0">The Ebbinghaus illusion was discovered by the German psychologist Hermann Ebbinghaus
          (1850–1909).The illusion was popularized by Edward B. Titchener in a 1901 textbook, in English, which is why
          the illusion is sometimes called "Titchener circles".</p>
        <p class="mb-0">The Ebbinghaus illusion is one of several size contrast illusions to have been studied by both
          philosophers and cognitive scientists. Bela Julesz (1928-2003), a Hungarian neuroscientist and experimental
          psychologist hypothesised that the illusory effect of the Ebbinghaus discs cannot be explained entirely in
          terms of retinal processes (Julesz 1971).</p>
        <p class="mb-0">In normal vision, the monocular information from each eye is sent along the optic nerve and
          undergoes binocular fusion in the cerebral cortex. This produces a `cyclopean’ perception, wherein the subject
          possesses a single point of view but has greatly improved powers of depth perception owing to binocular cues
          such as parallax and convergence (the tendency to go very slightly ‘cross-eyed’ as we look at an object
          close-up). The Ebbinghaus illusion occurs even when the pattern of discs exists only as a disparity between
          the stereographic images, i.e. the discs are discernible only after the cortical fusion of two random-dot
          images. Julesz 1971 concluded that the illusion must therefore be generated beyond the eye and the optic
          nerve, existing on a metaphorical ‘cyclopean retina’ which highly suggests the image of cortical processes.
          For an in-depth discussion of the relative roles of monocular depth cues (e.g. size, perspective) and
          binocular cues in the Ebbinghaus illusion, (see Papathomas et al. 1996).</p>
        <footer class="blockquote-footer">Ebbinghaus Illusion at <cite title="The Illusions Index">
          <a href="https://www.illusionsindex.org/ir/ebbinghaus-illusion" target="_blank">The Illusions Index</a></cite>
        </footer>
      </blockquote>
    </div>
  </div>
</template>

<script>
  import Hering from './Hering'
  import Homer from './Homer'
  import Race from './Race'
  import Blivet from './Blivet'
  import Grid from './Grid'
  import Dots from './Dots'
  import Runners from './Runners'
  import Square from './Square'
  import Bar from './Bar'
  import Ebbinghaus from './Ebbinghaus'
  import CafeWall from './CafeWall'
  import Arrows from './Arrows'
  import Delboeuf from './Delboeuf'

  export default {
    name: 'Illusions',
    data () {
      return {
        illusion: 'hering',
        illusions: [
          {code: 'hering', name: 'Hering illusion'},
          {code: 'blivet', name: 'Blivet'},
          {code: 'dots', name: 'Stroboscopic motion'},
          {code: 'ebbinghaus', name: 'Ebbinghaus'},
          {code: 'race', name: 'Stuart Anstis'},
          {code: 'homer', name: 'Negative After Image'},
          {code: 'runners', name: 'Perspective Room'},
          {code: 'cafe', name: 'Cafe Wall'},
          {code: 'arrows', name: 'Muller-Lyer'},
          {code: 'delboeuf', name: 'Delboeuf'},
          {code: 'hermann', name: 'Hermann'},
          {code: 'square', name: 'Illusory contours'},
          {code: 'bar', name: 'Simultaneous Contrast Illusion'}
        ]
      }
    },
    components: {
      Hering,
      Homer,
      Race,
      Blivet,
      Grid,
      Dots,
      Runners,
      Square,
      Bar,
      Ebbinghaus,
      CafeWall,
      Arrows,
      Delboeuf
    }
  }
</script>

<style scoped>

</style>