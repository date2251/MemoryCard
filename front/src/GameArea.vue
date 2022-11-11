<template>
  <div id="app" style="position: relative;">
    <!-- クリア前 -->
    <div v-if ='hitNum < 13'>
      <div style="color: white">試行回数：{{turnNum}}</div>
        <div
          v-for="(card, index) in cards" :key="card.id"
          @click='turnOver(index + 1)' v-bind:class='{card: !card.isOpened, opened:card.isOpened, hitted:card.isHit}'
        >
          <img :src="imageSrouce(card.id)">
        </div>
    </div>
    <!-- クリア後 -->
    <div v-else>
      <p class="resulttitle">Clear</p>
      <p>試行回数：{{turnNum}}</p>
      <div class="resultBtnWrap">
        <button class="resultBtn" @click='replay()'>もう一度遊ぶ</button>
        <button class="resultBtn" @click='register()'>結果を登録する</button>
        <form v-if ='regFlg' @submit.prevent="registerpost" class="form__control">
          <label for="" class="form__label">名前：</label>
          <input class="form__input" v-model='userName' type="text" name="user_name">
          <button type="submit">登録</button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { deserialize } from 'deserialize-json-api'

export default {
  data: function () {
    return {
      cards: [],
      // カウント変数 //
      clickNum: 0, beforeId: 0, afterId: 0, turnNum: 0, hitNum: 0,
      regFlg: false,
      userName: ''
    }
  },
  mounted () {
    this.fetchCards();
  },
  methods: {
    fetchCards: function () {
      this.$axios
        .get('/api/v1/cards')
        .then(({ data }) => {
          this.cards = deserialize(data).data;
          this.shuffleCards();
        })
        .catch(function (error) {
          console.log(error);
        })
    },
    shuffleCards: function () {
      // 順番をランダム化 //
      for (let i=this.cards.length; i>0; i--) {
        let rnd = Math.floor(Math.random() * (this.cards.length - 1));
        let tmp = this.cards[i-1];
        this.cards[i-1] = this.cards[rnd];
        this.cards[rnd] = tmp;
      }
      // 答え //
      console.log(this.cards.map((obj) => obj.num));
    },
    imageSrouce: function (num) {
      return require('./assets/images/' + String(num) + '.png');
    },
    turnOver: function (id) {
      // 2枚以上はめくれない //
      if (this.clickNum < 2) {
        if (this.clickNum == 0) {
          // 1枚目 //
          this.cards[id-1].isOpened = true;
          this.clickNum += 1;
          this.beforeId = id;
        } else if (id != this.beforeId) {
          // 2枚目 //
          this.cards[id-1].isOpened = true;
          this.afterId = id;
          this.clickNum += 1;
          this.turnNum += 1;
          if (this.cards[this.beforeId - 1].num == this.cards[id-1].num) {
            // 1秒後にヒットにする関数 //
            setTimeout(() => {
              this.cards[this.beforeId - 1].isHit = true;
              this.cards[this.afterId - 1].isHit = true;
              this.clickNum = 0;
              this.hitNum += 1;
            }, 1200);
          } else {
            // 3秒後に裏に戻す関数 //
            setTimeout(() => {
              this.cards[this.beforeId - 1].isOpened = false;
              this.cards[this.afterId - 1].isOpened = false;
              this.clickNum = 0;
            }, 3000);
          }
        }
      }
    },
    // リプレイ時リロード //
    replay: function () {
      this.$router.go({path: this.$router.currentRoute.path, force: true})
    },
    // ランキング登録選択 //
    register: function () {
      this.regFlg = true;
    },
    // ランキング登録API //
    registerpost: function () {
      this.$axios
        .post('/api/v1/rankings', { 'ranking' : {
          user_name: this.userName,
          try_num: this.turnNum
        }})
        .then(() => {
          window.location.replace('/#/ranking')
        })
        .catch(function (error) {
          console.log(error);
        })
    }
  }
}

</script>

<style scoped>
p {
  color: white;
}

.resulttitle {
  font-size: 3em;
  text-align: center;
}

img {
  width: 100%;
}

.card {
  background-image:url(./images/card_back.png);
  background-repeat: no-repeat;
  background-size: contain;
  background-position:center;
  width: 10%;
  display: inline-block;
  content: none;
  text-indent:100%;
  white-space:nowrap;
  overflow:hidden;
}

.opened {
  width: 10%;
  display: inline-block;
  transform: rotateY( 180deg );
  transition: transform 1s ease;
}

.hitted {
  transition-delay: 2.0s;
  transform: rotateY( 180deg );
  transition: transform 1s ease;
  visibility: hidden;
}

.resultBtnWrap {
  text-align: center;
}

.resultBtn {
  width: 150px;
  height: 50px;
}
</style>
