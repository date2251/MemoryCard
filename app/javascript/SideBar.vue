<template>
	<div style="width: 15%; margin-left: 10px">
		<ul class="inner">
			<li><img :src="images[4].src"></li>
			<li><a href="#"><img :src="images[0].src"></a></li>
			<li><router-link :to="{ name: 'RankingPage' }"><img :src="images[1].src"></router-link></li>
			<li><a href="#"><img :src="images[2].src"></a></li>
			<li><a href="#"><img :src="images[3].src"></a></li>
		</ul>
	</div>
</template>

<script>
import ruleimg from "../assets/images/rule.png"
import usageimg from "../assets/images/usage.png"
import rankingimg from "../assets/images/ranking.png"
import frameworkimg from "../assets/images/framework.png"
import categoryimg from "../assets/images/category.png"

export default {
	data: function () {
		return {
			images: [
				{src: ruleimg},
				{src: rankingimg},
				{src: usageimg},
				{src: frameworkimg},
				{src: categoryimg}
			]
		}
	}
}
</script>

<style scoped>
ul {
	min-height: 560px;
	margin-top: 0px;
	padding: 0 5px;
	overflow: hidden;
	list-style: none;
	background-color: gray;
	text-align: center;
}

ul {
	padding-top: 5px;
	padding-bottom: 5px;
}

li img {
	width: 100%;
}

a {
	color: white;
	text-decoration: none;
}
</style>
