<script setup>
import { ref } from 'vue'

// 模擬商品資料
const products = ref([
  {
    id: 1,
    name: '特殊傳說Ⅲ vol.09000',
    author: '護玄',
    publisher: '蓋亞文化',


    isbn: '9786263841253',
    stock: 3,

    img: '/picture/9789865030612.jpg',
    sellers: [
      {
        name: '貓咪賣家',
        condition: '六成新',
        note: '少量筆記',
        status: '泛黃',
        date: '2025/1/1',
        price: 100,
        images: ['/picture/1-1.jpg','/picture/1-2.jpg','/picture/1-3.jpg']
      },
      {
        name: '狗狗賣家',
        condition: '五成新',
        note: '有',
        status: '無',
        date: '2025/1/1',
        price: 100,
        images: [
          'https://via.placeholder.com/100x100?text=A',
          'https://via.placeholder.com/100x100?text=B',
          'https://via.placeholder.com/100x100?text=C',
          'https://via.placeholder.com/100x100?text=D'
        ]
      }
    ]
  },
  {
    id: 2,
    name: '魔法書Ⅱ vol.05',
    author: '某作者',
    publisher: '某出版社',


    isbn: '9781234567890',
    stock: 5,

    img: 'https://via.placeholder.com/300x300',
    sellers: [
      {
        name: '小明',
        condition: '九成新',
        note: '無',
        status: '良好',
        date: '2025/2/1',
        price: 180,
        images: [
          'https://via.placeholder.com/100x100?text=X1',
          'https://via.placeholder.com/100x100?text=X2',
          'https://via.placeholder.com/100x100?text=X3',
          'https://via.placeholder.com/100x100?text=X4'
        ]
      },
      {
        name: '忠明',
        condition: '九成新',
        note: '無',
        status: '良好',
        date: '2025/2/1',
        price: 180,
        images: [
          'https://via.placeholder.com/100x100?text=X1',
          'https://via.placeholder.com/100x100?text=X2',
          'https://via.placeholder.com/100x100?text=X3',
          'https://via.placeholder.com/100x100?text=X4'
        ]
      },
      {
        name: '大明',
        condition: '九成新',
        note: '無',
        status: '良好',
        date: '2025/2/1',
        price: 180,
        images: [
          'https://via.placeholder.com/100x100?text=X1',
          'https://via.placeholder.com/100x100?text=X2',
          'https://via.placeholder.com/100x100?text=X3',
          'https://via.placeholder.com/100x100?text=X4'
        ]
      }
    ]
  },
  {
    id: 3,
    name: '三芝小豬',
    author: '某作者',
    publisher: '某出版社',


    isbn: '9781234567890',
    stock: 5,

    img: 'https://via.placeholder.com/300x300',
    sellers: [
      {
        name: '小明',
        condition: '九成新',
        note: '無',
        status: '良好',
        date: '2025/2/1',
        price: 180,
        images: [
          'https://via.placeholder.com/100x100?text=X1',
          'https://via.placeholder.com/100x100?text=X2',
          'https://via.placeholder.com/100x100?text=X3',
          'https://via.placeholder.com/100x100?text=X4'
        ]
      },
      {
        name: '忠明',
        condition: '九成新',
        note: '無',
        status: '良好',
        date: '2025/2/1',
        price: 180,
        images: [
          'https://via.placeholder.com/100x100?text=X1',
          'https://via.placeholder.com/100x100?text=X2',
          'https://via.placeholder.com/100x100?text=X3',
          'https://via.placeholder.com/100x100?text=X4'
        ]
      },
      {
        name: '大明',
        condition: '九成新',
        note: '無',
        status: '良好',
        date: '2025/2/1',
        price: 180,
        images: [
          'https://via.placeholder.com/100x100?text=X1',
          'https://via.placeholder.com/100x100?text=X2',
          'https://via.placeholder.com/100x100?text=X3',
          'https://via.placeholder.com/100x100?text=X4'
        ]
      }
    ]
  }
])

// 控制頁面狀態
const showDetail = ref(false)
const selectedProduct = ref(null)

// 放大圖片控制
const showModal = ref(false)
const currentImage = ref("")

function openModal(img) {
  currentImage.value = img
  showModal.value = true
}

function closeModal() {
  showModal.value = false
  currentImage.value = ""
}

// 點商品卡切換詳細頁
function viewDetail(product) {
  selectedProduct.value = product
  showDetail.value = true
}

// 返回列表頁
function goBack() {
  selectedProduct.value = null
  showDetail.value = false
}

// 暴露 goBack 方法給父組件使用
defineExpose({
  goBack
})
</script>

<template>
  <!-- 商品列表 -->
  <div class="page-background">
    <div class="content-wrapper">
      <div v-if="!showDetail" class="apple row row-cols-1 row-cols-md-3 g-4">
    <div class="col" v-for="product in products" :key="product.id">
      <div class="card" @click="viewDetail(product)" style="cursor:pointer">
        <div style="text-align: center;">
          <img class="imgall" :src="product.img" alt="商品圖片" style="height: 200px; width: 100%; object-fit: contain; ">
        </div>
        <div class="card-body">
          <h5 class="card-title">{{ product.name }}</h5>

          <p class="card-text">庫存: {{ product.stock }}</p>
        </div>
      </div>
    </div>
  </div>



  <!-- 商品詳細頁 -->
  <div v-else class="card2 mx-auto my-3 p-4 shadow-lg" style="width: 80%; background: white; border-radius: 20px;">
    <button class="btn btn-outline-secondary mb-3" @click="goBack" style="position: fixed; bottom: 30px; right: 30px; z-index: 1000; box-shadow: 0 4px 6px rgba(0,0,0,0.1);"><i class="bi bi-arrow-up-left-circle"></i> 返回列表</button>

    <div class="d-flex gap-4 align-items-start">
      <!-- 圖片圖片~ -->
      <div style="width: 40%; flex-shrink: 0; text-align: center;">
        <img :src="selectedProduct.img" alt="商品圖片" class="img-fluid rounded shadow-sm" style="max-height: 400px; object-fit: contain;">
      </div>
      <div class="flex-grow-1">
        <div class="card-body h-100 d-flex flex-column justify-content-center">
          <h2 class="card-title fw-bold mb-3" style="color: #333;">{{ selectedProduct.name }}</h2>
          <div class="fs-5 text-muted mb-2">作者: <span class="text-dark">{{ selectedProduct.author }}</span></div>
          <div class="fs-5 text-muted mb-2">出版社: <span class="text-dark">{{ selectedProduct.publisher }}</span></div>
          <div class="fs-5 text-muted mb-2">ISBN: <span class="text-dark">{{ selectedProduct.isbn }}</span></div>
          <div class="fs-5 text-muted mt-3">庫存: <span class="badge bg-success">{{ selectedProduct.stock }}</span></div>
        </div>
      </div>
    </div>

        <!-- 商品販售狀態 -->
        <div class="pt-5">
          <table class="table">
            <thead>
              <tr>
                <th>#</th>
                <th>賣家</th>
                <th>幾成新</th>
                <th>有無筆記</th>
                <th>書況</th>
                <th>上架時間</th>
                <th>二手價</th>
                <th>商品圖片 (4 張)</th>
                <th>購買</th>
              </tr>
            </thead>
            <tbody>
              <tr v-for="(seller, index) in selectedProduct.sellers" :key="index">
                <th scope="row">{{ index + 1 }}</th>
                <td>{{ seller.name }}</td>
                <td>{{ seller.condition }}</td>
                <td>{{ seller.note }}</td>
                <td>{{ seller.status }}</td>
                <td>{{ seller.date }}</td>
                <td>{{ seller.price }}元</td>

                <!-- 每個賣家 4 張圖片，可點擊放大 -->
                <td>
                  <div style="display: flex; gap: 5px;">
                    <img
                      v-for="(img, i) in seller.images"
                      :key="i"
                      :src="img"
                      class="img-thumbnail object-fit-cover"
                      style="width: 60px; height: 60px; cursor:pointer;"
                      @click="openModal(img)"
                    >
                  </div>
                </td>

                <td>
                  <button class="btn btn-primary btn-sm">
                    <i class="bi bi-cart4"></i>
                  </button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- 放大圖片 Modal -->
  <!-- 放大圖片 Modal -->
  <div v-if="showModal" class="modal fade show" tabindex="-1" style="display: block; background-color: rgba(0,0,0,0.5);" @click.self="closeModal">
    <div class="modal-dialog modal-dialog-centered modal-md">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">圖片預覽</h5>
          <button type="button" class="btn-close" @click="closeModal"></button>
        </div>
        <div class="modal-body text-center">
          <img :src="currentImage" class="img-fluid" alt="Enlarged view">
        </div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.imgall {
  width: 100%;
  height: 300px;
  background: rgb(255, 254, 254);
  border-radius: 30px 30px 0 0;
}
.card{
  border-radius: 30px;
}

.card-body {
  background: rgb(255, 255, 255);
  border-radius: 0 0 30px 30px;
  padding: 50px 0 0 20px;
}

.card-text {
  margin: 12px;
}

.card2 {
  padding-top: 20px;
  /* background: pink;  Removed debug color */
}
.page-background {
  background-color: #bbbbbb69; /* SkyBlue */
  min-height: 100vh;
  padding: 120px 0 0 0;
}
.content-wrapper {
  background-color: rgba(255, 255, 255, 0.5);
  width: 80%;
  margin: 0 auto;
  padding: 20px;
  min-height: 100vh;
}
.row{
  padding: 50px 100px;
}
</style>
