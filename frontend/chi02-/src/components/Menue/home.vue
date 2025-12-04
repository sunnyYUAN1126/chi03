<script setup>
import { ref, provide } from 'vue';
import product from './products.vue';

// 暴露重置商品詳細頁的方法
const resetProductView = () => {
  if (productRef.value) {
    productRef.value.goBack();
  }
}

const productRef = ref(null);
provide('resetProductView', resetProductView);
provide('productRef', productRef);

// 暴露 productRef 給父組件使用
defineExpose({
  productRef
})

</script>

<template>
  <nav class="navbar bg-body-tertiary  navbar-expand-lg bg-body-tertiary fixed-top second-nav">
    <div class="container-fluid">
      <a class="navbar-brand"></a>


    <ul class="nav nav-pills">
      <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="#">ALL</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">文學與人文類</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">社會科學類</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">商業與管理類</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">理工與資訊類</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">醫學與健康類</a>
      </li>
    </ul>          
    

    <form class="d-flex" role="search">
      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"/>
      <button class="btn btn-outline-success" type="submit">
        <i class="bi bi-search"></i>
      </button>
    </form>

    </div>
  </nav>

  <product ref="productRef"/>

             



</template>


<style scoped>
.nav-link {
  color: rgb(0, 0, 0) !important;
}
.active{
  background: rgb(216, 210, 211) !important;
}
.nav-link:hover {
  background-color: rgb(216, 210, 211) !important; /* 可改成喜歡的顏色 */
  color: rgb(0, 0, 0) !important;
  font-weight: bold;
}


.second-nav {
  top: 80px;  /* 第一個 nav 的高度 */
}


</style>

