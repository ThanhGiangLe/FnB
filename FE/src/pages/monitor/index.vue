<template>
  <v-card style="height: 100vh; max-width: 1208px; margin: 0 auto">
    <v-tabs v-model="tab">
      <v-tab prepend-icon="mdi-food" value="food">Danh sách món ăn</v-tab>
      <v-tab
        prepend-icon="mdi-file-chart-outline"
        value="report"
        v-if="user.role !== 'Staff'"
        >Báo cáo</v-tab
      >
      <v-tab
        prepend-icon="mdi-account-group"
        value="users"
        v-if="user.role !== 'Staff'"
        >Nhân viên</v-tab
      >
      <v-tab
        prepend-icon="mdi-cart-outline"
        value="cart"
        v-if="user.role !== 'Staff'"
        >Bán hàng</v-tab
      >
      <v-tab
        prepend-icon="mdi-currency-usd"
        value="currency"
        v-if="user.role !== 'Staff'"
        >Két tiền</v-tab
      >
      <v-tab
        prepend-icon="mdi-warehouse"
        value="warehouse"
        v-if="user.role !== 'Staff'"
        >Hàng tồn</v-tab
      >
      <v-tab
        prepend-icon="mdi-map-outline"
        value="map"
        v-if="user.role !== 'Staff'"
        >Khu vực</v-tab
      >
      <v-tab prepend-icon="mdi-sale" value="sale" v-if="user.role !== 'Staff'"
        >Thuế - Phí - Giảm giá</v-tab
      >
      <v-tab prepend-icon="mdi-cog" value="settings">Thay đổi mật khẩu</v-tab>
      <v-tab prepend-icon="mdi-logout" value="exit">Đăng xuất</v-tab>
    </v-tabs>

    <v-card-text style="height: 100%">
      <v-tabs-window v-model="tab" style="height: 100%">
        <v-tabs-window-item value="food" style="height: 100%">
          <MonitorFoodManagement />
        </v-tabs-window-item>

        <v-tabs-window-item value="report" style="height: 100%">
          <MonitorReportManagement />
        </v-tabs-window-item>

        <v-tabs-window-item value="users">
          <MonitorEmployeeManagement />
        </v-tabs-window-item>

        <v-tabs-window-item value="cart">
          <MonitorSalesManagement />
        </v-tabs-window-item>

        <v-tabs-window-item value="currency">
          <MonitorCashRegisterManagement />
        </v-tabs-window-item>

        <v-tabs-window-item value="warehouse">
          <MonitorInventoryManagement />
        </v-tabs-window-item>

        <v-tabs-window-item value="map">
          <MonitorAreaManagement />
        </v-tabs-window-item>

        <v-tabs-window-item value="sale">
          <MonitorTaxFeesDiscountsManagement />
        </v-tabs-window-item>

        <v-tabs-window-item value="settings">
          <MonitorUpdatePasswordManagement />
        </v-tabs-window-item>

        <v-tabs-window-item value="exit">
          <logoutUser />
        </v-tabs-window-item>
      </v-tabs-window>
    </v-card-text>
  </v-card>
</template>
<script setup>
import { useUserStore } from "@/stores/user.js";
import { useRouter } from "vue-router";
import { useGlobalStore } from "@/stores/app.js";
import axios from "axios";
import { computed, ref } from "vue";
import API_ENDPOINTS from "@/api/api.js";
import { toast } from "vue3-toastify";
import "vue3-toastify/dist/index.css";

import MonitorMainContent from "@/components/monitor/mainContent/index.vue"; // 0
import MonitorFoodManagement from "@/components/monitor/foodManagement/index.vue"; // 1
import MonitorReportManagement from "@/components/monitor/reportManagement/index.vue"; // 2
import MonitorEmployeeManagement from "@/components/monitor/employeeManagement/index.vue"; // 3
import MonitorSalesManagement from "@/components/monitor/salesManagement/index.vue"; // 4
import MonitorCashRegisterManagement from "@/components/monitor/cashRegisterManagement/index.vue"; // 5
import MonitorInventoryManagement from "@/components/monitor/inventoryManagement/index.vue"; // 6
import MonitorAreaManagement from "@/components/monitor/areaManagement/index.vue"; // 7
import MonitorTaxFeesDiscountsManagement from "@/components/monitor/taxFeesDiscounts/index.vue"; // 8
import MonitorUpdatePasswordManagement from "@/components/monitor/updatePassword/index.vue"; // 9
import logoutUser from "@/components/monitor/logoutUser/index.vue"; // 10

const router = useRouter();
const globalStore = useGlobalStore();
const userStore = useUserStore();
const dialogVisibleInfo = ref(false);
const newPassword = ref("");
const newConfirmPassword = ref("");
const tab = ref("main");

// Lấy thông tin người dùng từ store
const user = computed(() => userStore.user);
console.log("User in Navigation: ", user.value);

const updateGlobalVariableCurrentPage = (indexPage) => {
  globalStore.updateGlobalVariableCurrentPage(indexPage);
};

// const exitAccountCurrent = () => {
//   userStore.clearUser();
//   router.push("/login");
// };

// const openDialogInfo = () => {
//   dialogVisibleInfo.value = true;
// };

// const closeDialogInfo = () => {
//   dialogVisibleInfo.value = false;
// };

// async function UpdatePassword() {
//   if (newPassword.value.trim() == "" || newConfirmPassword.value.trim() == "") {
//     toast.warn("Please enter a valid Password.", {
//       position: "top-right",
//       autoClose: 3000,
//       hideProgressBar: false, // Hiện thanh tiến trình
//       closeOnClick: true, // Đóng khi nhấp vào thông báo
//       pauseOnHover: true, // Dừng khi di chuột lên thông báo
//       draggable: true, // Kéo thông báo
//       progress: undefined, // Tiến độ (nếu có)
//     });
//     return;
//   }
//   if (newPassword.value !== newConfirmPassword.value) {
//     toast.warn("Passwords do not match. Please try again.", {
//       position: "top-right",
//       autoClose: 3000,
//       hideProgressBar: false, // Hiện thanh tiến trình
//       closeOnClick: true, // Đóng khi nhấp vào thông báo
//       pauseOnHover: true, // Dừng khi di chuột lên thông báo
//       draggable: true, // Kéo thông báo
//       progress: undefined, // Tiến độ (nếu có)
//     });
//     return;
//   }
//   try {
//     console.log("user.email", user.value.email);
//     console.log("confirmPassword.value", newConfirmPassword.value);
//     const response = await axios.post(API_ENDPOINTS.UPDATE_PASSWORD, {
//       Email: user.value.email,
//       NewPassword: newConfirmPassword.value,
//     });

//     if (response.data.success) {
//       toast.success("Password updated successfully!", {
//         position: "top-right",
//         autoClose: 2000,
//         hideProgressBar: false, // Hiện thanh tiến trình
//         closeOnClick: true, // Đóng khi nhấp vào thông báo
//         pauseOnHover: true, // Dừng khi di chuột lên thông báo
//         draggable: true, // Kéo thông báo
//         progress: undefined, // Tiến độ (nếu có)
//       });
//       setTimeout(() => {
//         router.push("/login");
//       }, 2000);
//     } else {
//       toast.error("Failed to update password. Please check your OTP.", {
//         position: "top-right",
//         autoClose: 2000,
//         hideProgressBar: false, // Hiện thanh tiến trình
//         closeOnClick: true, // Đóng khi nhấp vào thông báo
//         pauseOnHover: true, // Dừng khi di chuột lên thông báo
//         draggable: true, // Kéo thông báo
//         progress: undefined, // Tiến độ (nếu có)
//       });
//     }
//   } catch (error) {
//     toast.error(
//       "An error occurred while updating the password. Please try again.",
//       {
//         position: "top-right",
//         autoClose: 3000,
//         hideProgressBar: false, // Hiện thanh tiến trình
//         closeOnClick: true, // Đóng khi nhấp vào thông báo
//         pauseOnHover: true, // Dừng khi di chuột lên thông báo
//         draggable: true, // Kéo thông báo
//         progress: undefined, // Tiến độ (nếu có)
//       }
//     );
//   }
// }
</script>
