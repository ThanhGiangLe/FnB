<template>
  <div
    class="reportManagement_totalAmount d-flex flex-wrap flex-column mt-5 pa-2 rounded"
    style="height: 100%"
  >
    <v-card style="height: 100%">
      <v-card-title class="pa-0 d-flex justify-center">
        <div class="d-flex align-center">
          <v-icon size="large" class="ma-1">mdi-file-chart-outline</v-icon>
          <span style="font-size: 26px">BÁO CÁO DOANH THU</span>
        </div>
        <!-- <JsonExcel class="btn btn-default" 
                  :data="dataTable" 
                  :fields="datafieldExcel" 
                  worksheet="My Worksheet" type="xlsx"
                  :name="nameFileExcel">
                  <VBtn class="text-none" size="small" prependIcon="mdi-crop" color="#8690A0">
                  Xuất Excel
                  </VBtn>
              </JsonExcel> -->
      </v-card-title>
      <v-tabs v-model="tab" bg-color="indigo-darken-3" class="mt-2">
        <v-tab value="employee">Nhân viên</v-tab>
        <v-tab value="category">Danh mục</v-tab>
        <v-tab value="time">Thời gian</v-tab>
      </v-tabs>

      <v-card-text
        class="px-2"
        :style="{ backgroundColor: 'var(--bg-color-item)' }"
      >
        <v-tabs-window v-model="tab">
          <v-tabs-window-item value="employee">
            <div
              class="reportManagement_chosseTime d-flex justify-md-space-between mb-2 mt-2"
            >
              <div>
                <!-- Lọc theo ngày -->
                <v-menu>
                  <template v-slot:activator="{ props }">
                    <v-btn
                      v-bind="props"
                      append-icon="mdi-chevron-down"
                      min-width="90px"
                      style="border: 1px solid #333"
                      size="small"
                      class="ms-2"
                    >
                      {{ selectedDayForEmp || "Ngày" }}
                    </v-btn>
                  </template>
                  <v-list max-height="200px" style="overflow-y: auto">
                    <v-list-item
                      v-for="day in dateList"
                      :key="day"
                      :value="day"
                      style="min-height: 36px !important"
                      @click="selectDayAndCallAPIForEmployee(day)"
                    >
                      <v-list-item-title style="font-size: 0.8rem">{{
                        day
                      }}</v-list-item-title>
                    </v-list-item>
                  </v-list>
                </v-menu>
                <!-- Lọc theo tháng -->
                <v-menu>
                  <template v-slot:activator="{ props }">
                    <v-btn
                      v-bind="props"
                      append-icon="mdi-chevron-down"
                      min-width="90px"
                      style="border: 1px solid #333"
                      size="small"
                      class="ms-2"
                    >
                      {{ selectedMonthForEmp || "Tháng" }}
                    </v-btn>
                  </template>
                  <v-list max-height="200px" style="overflow-y: auto">
                    <v-list-item
                      v-for="(month, index) in monthList"
                      :key="index"
                      :value="month"
                      style="min-height: 36px !important"
                      @click="selectMonthAndCallAPIForEmployee(month)"
                    >
                      <v-list-item-title>{{ month }}</v-list-item-title>
                    </v-list-item>
                  </v-list>
                </v-menu>
              </div>
              <v-btn
                style="border: 1px solid #333; min-width: 60px"
                size="small"
                class="ms-5"
                @click="resetTimeFillterRevenueOrderForEmployee"
              >
                Làm mới
              </v-btn>
            </div>
            <div
              class="reportManagement_totalAmount_salesSummary d-flex mt-2 mb-2"
              style="height: 350px; max-height: 350px; overflow-y: auto"
            >
              <v-data-table
                :headers="headersEmployee"
                :loading="loading"
                :items="filteredTotalRevenueForEmployee"
                height="calc(33vh - 2rem)"
                density="compact"
                fixed-footer
                fixed-header
              >
                <template v-slot:item.fullName="{ item }">
                  <span
                    style="
                      font-weight: 500;
                      color: rgba(var(--v-theme-primary), 1);
                    "
                  >
                    {{ item.fullName ? item.fullName : "-" }}
                  </span>
                </template>
                <template v-slot:item.totalRevenue="{ item }">
                  <div class="d-user-contract-inventory-chart-progress-bar">
                    <div
                      class="d-user-contract-inventory-chart-progress-bar-container"
                    >
                      <div
                        class="d-user-contract-inventory-chart-progress-bar-indicator"
                        :style="{
                          width:
                            (item.totalRevenue / totalRevenueMax) * 100 + '%',
                        }"
                      ></div>
                    </div>
                    <div
                      class="d-user-contract-inventory-chart-progress-bar-text"
                    >
                      {{
                        item.totalRevenue
                          ? formatCurencyFromApiToView(item.totalRevenue)
                          : 0
                      }}
                    </div>
                  </div>
                </template>
                <template v-slot:loading>
                  <v-skeleton-loader type="table-row@5"></v-skeleton-loader>
                </template>
                <template v-slot:no-data>
                  <div
                    class="d-event-info-item d-emp-activity-item-content d-emp-activity-no-data pa-6"
                    style="background: none"
                  >
                    <VIcon class="ma-2" icon="mdi-robot-dead-outline"></VIcon>
                    <span>Hệ thống không tìm thấy thông tin</span>
                  </div>
                </template>
              </v-data-table>
            </div>
          </v-tabs-window-item>
          <v-tabs-window-item value="category">
            <div
              class="reportManagement_chosseTime d-flex justify-md-space-between mb-2 mt-2"
            >
              <div>
                <!-- Lọc theo ngày -->
                <v-menu>
                  <template v-slot:activator="{ props }">
                    <v-btn
                      v-bind="props"
                      append-icon="mdi-chevron-down"
                      min-width="90px"
                      style="border: 1px solid #333"
                      size="small"
                      class="ms-2"
                    >
                      {{ selectedDayForCate || "Ngày" }}
                    </v-btn>
                  </template>
                  <v-list max-height="200px" style="overflow-y: auto">
                    <v-list-item
                      v-for="day in dateList"
                      :key="day"
                      :value="day"
                      style="min-height: 36px !important"
                      @click="selectDayAndCallAPIForCategory(day)"
                    >
                      <v-list-item-title style="font-size: 0.8rem">{{
                        day
                      }}</v-list-item-title>
                    </v-list-item>
                  </v-list>
                </v-menu>
                <!-- Lọc theo tháng -->
                <v-menu>
                  <template v-slot:activator="{ props }">
                    <v-btn
                      v-bind="props"
                      append-icon="mdi-chevron-down"
                      min-width="90px"
                      style="border: 1px solid #333"
                      size="small"
                      class="ms-2"
                    >
                      {{ selectedMonthForCate || "Tháng" }}
                    </v-btn>
                  </template>
                  <v-list max-height="200px" style="overflow-y: auto">
                    <v-list-item
                      v-for="(month, index) in monthList"
                      :key="index"
                      :value="month"
                      style="min-height: 36px !important"
                      @click="selectMonthAndCallAPIForCategory(month)"
                    >
                      <v-list-item-title>{{ month }}</v-list-item-title>
                    </v-list-item>
                  </v-list>
                </v-menu>
              </div>
              <v-btn
                style="border: 1px solid #333; min-width: 60px"
                size="small"
                class="ms-5"
                @click="resetTimeFillterRevenueOrderForCategory"
              >
                Làm mới
              </v-btn>
            </div>
            <div
              class="reportManagement_totalAmount_salesSummary d-flex mb-2"
              style="max-height: 305px; overflow-y: auto"
            >
              <v-data-table
                :headers="headersCategory"
                :loading="loading"
                :items="filteredTotalRevenueForCategory"
                height="calc(33vh - 2rem)"
                density="compact"
                fixed-footer
                fixed-header
              >
                <template v-slot:item.categoryName="{ item }">
                  <span
                    style="
                      font-weight: 500;
                      color: rgba(var(--v-theme-primary), 1);
                    "
                  >
                    {{ item.categoryName ? item.categoryName : "-" }}
                  </span>
                </template>
                <template v-slot:item.totalRevenue="{ item }">
                  <div class="d-user-contract-inventory-chart-progress-bar">
                    <div
                      class="d-user-contract-inventory-chart-progress-bar-container"
                    >
                      <div
                        class="d-user-contract-inventory-chart-progress-bar-indicator"
                        :style="{
                          width:
                            (item.totalRevenue / totalRevenueForCategoryMax) *
                              100 +
                            '%',
                        }"
                      ></div>
                    </div>
                    <div
                      class="d-user-contract-inventory-chart-progress-bar-text"
                    >
                      {{
                        item.totalRevenue
                          ? formatCurencyFromApiToView(item.totalRevenue)
                          : 0
                      }}
                    </div>
                  </div>
                </template>
                <template v-slot:loading>
                  <v-skeleton-loader type="table-row@5"></v-skeleton-loader>
                </template>
                <template v-slot:no-data>
                  <div
                    class="d-event-info-item d-emp-activity-item-content d-emp-activity-no-data pa-6"
                    style="background: none"
                  >
                    <VIcon icon="mdi-robot-dead-outline"></VIcon>
                    <span>Hệ thống không tìm thấy thông tin</span>
                  </div>
                </template>
              </v-data-table>
            </div>
          </v-tabs-window-item>
          <v-tabs-window-item value="time" style="min-height: 300px">
            <div
              class="reportManagement_chosseTime d-flex justify-md-space-between mb-2 mt-2"
            >
              <div>
                <!-- Lọc cho hôm nay -->
                <v-btn
                  style="border: 1px solid #333"
                  size="small"
                  @click="selectCurrentDayAndCallAPI"
                >
                  Hôm nay
                </v-btn>
                <!-- Lọc theo ngày -->
                <v-menu>
                  <template v-slot:activator="{ props }">
                    <v-btn
                      v-bind="props"
                      append-icon="mdi-chevron-down"
                      min-width="90px"
                      style="border: 1px solid #333"
                      size="small"
                      class="ms-2"
                    >
                      {{ selectedDay || "Ngày" }}
                    </v-btn>
                  </template>
                  <v-list max-height="200px" style="overflow-y: auto">
                    <v-list-item
                      v-for="day in dateList"
                      :key="day"
                      :value="day"
                      style="min-height: 36px !important"
                      @click="selectDayAndCallAPI(day)"
                    >
                      <v-list-item-title style="font-size: 0.8rem">{{
                        day
                      }}</v-list-item-title>
                    </v-list-item>
                  </v-list>
                </v-menu>
                <!-- Lọc theo tháng -->
                <v-menu>
                  <template v-slot:activator="{ props }">
                    <v-btn
                      v-bind="props"
                      append-icon="mdi-chevron-down"
                      min-width="90px"
                      style="border: 1px solid #333"
                      size="small"
                      class="ms-2"
                    >
                      {{ selectedMonth || "Tháng" }}
                    </v-btn>
                  </template>
                  <v-list max-height="200px" style="overflow-y: auto">
                    <v-list-item
                      v-for="(month, index) in monthList"
                      :key="index"
                      :value="month"
                      style="min-height: 36px !important"
                      @click="selectMonthAndCallAPI(month)"
                    >
                      <v-list-item-title>{{ month }}</v-list-item-title>
                    </v-list-item>
                  </v-list>
                </v-menu>
              </div>
              <v-btn
                style="border: 1px solid #333; min-width: 60px"
                size="small"
                class="ms-5"
                @click="resetTimeFillterRevenueOrder"
              >
                Làm mới
              </v-btn>
            </div>
            <div class="reportManagement_totalAmount_salesSummary d-flex">
              <!-- Hiển thị tổng doanh thu -->
              <div
                class="reportManagement_totalAmount_salesSummary_revenue w-50 pa-3 rounded-lg me-1"
                style="border: 1px solid #333; background-color: rgb(32 32 32)"
              >
                <!-- Nếu có tháng được chọn -->
                <div v-if="selectedMonth != ''">
                  <span>Doanh thu</span>
                  <h2>{{ formatCurencyFromApiToView(totalRevenue) }} vnđ</h2>
                  <div>
                    <v-icon
                      color="green"
                      v-if="totalRevenue > totalRevenueYesterday"
                      >mdi-trending-up</v-icon
                    >
                    <v-icon color="red" v-else>mdi-trending-down</v-icon>
                    <span
                      style="color: green"
                      v-if="totalRevenue > totalRevenueYesterday"
                      >{{ calculateRevenuePercentage.toFixed(1) }}%</span
                    >
                    <span style="color: red" v-else
                      >{{ calculateRevenuePercentage.toFixed(1) }}%</span
                    >
                    <span style="font-size: 12px; margin-left: 6px"
                      >so với {{ previousMonth }}</span
                    >
                  </div>
                </div>
                <!-- Nếu có ngày được chọn -->
                <div v-else-if="selectedDay != ''">
                  <span>Doanh thu</span>
                  <h2>{{ formatCurencyFromApiToView(totalRevenue) }}</h2>
                  <div>
                    <v-icon
                      color="green"
                      v-if="totalRevenue > totalRevenueYesterday"
                      >mdi-trending-up</v-icon
                    >
                    <v-icon color="red" v-else>mdi-trending-down</v-icon>
                    <span
                      style="color: green"
                      v-if="totalRevenue > totalRevenueYesterday"
                      >{{ calculateRevenuePercentage.toFixed(1) }}%</span
                    >
                    <span style="color: red" v-else
                      >{{ calculateRevenuePercentage.toFixed(1) }}%</span
                    >
                    <span style="font-size: 12px; margin-left: 6px">
                      so với {{ previousDay }}
                    </span>
                  </div>
                </div>
                <!-- Nếu chọn ngày là hôm nay -->
                <div v-else-if="selectedCurrentDay != ''">
                  <span>Doanh thu</span>
                  <h2>{{ formatCurencyFromApiToView(totalRevenue) }} vnđ</h2>
                  <div>
                    <v-icon
                      v-if="totalRevenue > totalRevenueYesterday"
                      color="green"
                      >mdi-trending-up</v-icon
                    >
                    <v-icon v-else color="red">mdi-trending-down</v-icon>
                    <span
                      style="color: green"
                      v-if="totalRevenue > totalRevenueYesterday"
                      >{{ calculateRevenuePercentage.toFixed(1) }}%</span
                    >
                    <span style="color: red" v-else
                      >{{ calculateRevenuePercentage.toFixed(1) }}%</span
                    >
                    <span style="font-size: 12px; margin-left: 6px"
                      >so với {{ previousCurrentDay }}</span
                    >
                  </div>
                </div>
                <!-- Nếu không có lựa chọn nào (Hiển thị mặc định) -->
                <div v-else>
                  <span>Doanh thu</span>
                  <h2>999,999,999 vnđ</h2>
                  <div>
                    <v-icon color="green">mdi-trending-up</v-icon>
                    <span style="color: green">100%</span>
                    <span style="font-size: 12px; margin-left: 4px"
                      >từ 1/1/2024 - 1/3/2024</span
                    >
                  </div>
                </div>
              </div>
              <!-- Hiển thị tổng đơn hàng -->
              <div
                class="reportManagement_totalAmount_salesSummary_order w-50 pa-3 rounded-lg ms-1"
                style="border: 1px solid #333; background-color: rgb(32 32 32)"
              >
                <!-- Nếu có tháng được chọn -->
                <div v-if="selectedMonth != ''">
                  <span>Đơn hàng</span>
                  <h2>{{ totalOrders }}</h2>
                  <div>
                    <v-icon
                      color="green"
                      v-if="totalOrders > totalOrdersYesterday"
                      >mdi-trending-up</v-icon
                    >
                    <v-icon color="red" v-else>mdi-trending-down</v-icon>
                    <span
                      style="color: green"
                      v-if="totalOrders > totalOrdersYesterday"
                      >{{ calculateOrderPercentage.toFixed(1) }}%</span
                    >
                    <span style="color: red" v-else
                      >{{ calculateOrderPercentage.toFixed(1) }}%</span
                    >
                    <span style="font-size: 12px; margin-left: 6px">
                      so với {{ previousMonth }}
                    </span>
                  </div>
                </div>

                <!-- Nếu có ngày được chọn -->
                <div v-else-if="selectedDay != ''">
                  <span>Đơn hàng</span>
                  <h2>{{ totalOrders }}</h2>
                  <div>
                    <v-icon
                      color="green"
                      v-if="totalOrders > totalOrdersYesterday"
                      >mdi-trending-up</v-icon
                    >
                    <v-icon color="red" v-else>mdi-trending-down</v-icon>
                    <span
                      style="color: green"
                      v-if="totalOrders > totalOrdersYesterday"
                      >{{ calculateOrderPercentage.toFixed(1) }}%</span
                    >
                    <span style="color: red" v-else
                      >{{ calculateOrderPercentage.toFixed(1) }}%</span
                    >
                    <span style="font-size: 12px; margin-left: 6px">
                      so với {{ previousDay }}
                    </span>
                  </div>
                </div>

                <!-- Nếu chọn ngày là hôm nay -->
                <div v-else-if="selectedCurrentDay != ''">
                  <span>Đơn hàng</span>
                  <h2>{{ totalOrders }}</h2>
                  <div>
                    <v-icon
                      color="green"
                      v-if="totalOrders > totalOrdersYesterday"
                      >mdi-trending-up</v-icon
                    >
                    <v-icon color="red" v-else>mdi-trending-down</v-icon>
                    <span
                      style="color: green"
                      v-if="totalOrders > totalOrdersYesterday"
                      >{{ calculateOrderPercentage.toFixed(1) }}%</span
                    >
                    <span style="color: red" v-else
                      >{{ calculateOrderPercentage.toFixed(1) }}%</span
                    >
                    <span style="font-size: 12px; margin-left: 6px">
                      so với {{ previousCurrentDay }}
                    </span>
                  </div>
                </div>

                <!-- Nếu không có lựa chọn nào (Hiển thị mặc định) -->
                <div v-else>
                  <span>Đơn hàng</span>
                  <h2>9999</h2>
                  <div>
                    <v-icon color="green">mdi-trending-up</v-icon>
                    <span style="color: green">100%</span>
                    <span style="font-size: 12px; margin-left: 4px">
                      từ 1/1/2024 - 1/3/2024
                    </span>
                  </div>
                </div>
              </div>
            </div>
          </v-tabs-window-item>
        </v-tabs-window>
      </v-card-text>
    </v-card>
  </div>
</template>
<script setup>
import { ref } from "vue";
import axios from "axios";
import { computed } from "vue";
import API_ENDPOINTS from "@/api/api.js";

// Cho biết số ngày trong tháng và năm hiện tại
const generateDates = (month, year) => {
  const daysInMonth = new Date(year, month, 0).getDate(); // Lấy số ngày trong tháng
  const dates = [];
  for (let day = 1; day <= daysInMonth; day++) {
    dates.push(`${day}-${month}-${year}`);
  }
  return dates;
};
// Cho biết số tháng trong năm
const generateMonths = (year) => {
  const months = [];
  for (let month = 1; month <= 12; month++) {
    months.push(`${month}-${year}`);
  }
  return months;
};

const currentDate = new Date();
const currentMonth = currentDate.getMonth() + 1; // Tháng hiện tại (cộng thêm 1 vì getMonth() trả về giá trị từ 0 đến 11)
const currentYear = currentDate.getFullYear(); // Năm hiện tại
console.log("Tháng hiện tại: ", currentMonth);

const dateList = ref(generateDates(currentMonth, currentYear));
const monthList = ref(generateMonths(currentYear));
const selectedMonth = ref("");
const selectedDay = ref("");
const selectedCurrentDay = ref("");
const totalRevenueOrderCurrentDay = ref([]);
const totalRevenueOrderCurrentMonth = ref([]);

const totalRevenue = ref(0);
const totalRevenueYesterday = ref(0);
const totalOrders = ref(0);
const totalOrdersYesterday = ref(0);

const totalRevenueMax = ref(0);
const totalRevenueForCategoryMax = ref(0);
const loading = shallowRef(true);
const filteredTotalRevenueForEmployee = ref([]);
const filteredTotalRevenueForCategory = ref([]);

const tab = ref(null);

const selectedMonthForEmp = ref("");
const selectedDayForEmp = ref("");

const selectedDayForCate = ref("");
const selectedMonthForCate = ref("");

async function selectMonthAndCallAPI(month) {
  selectedMonth.value = month;
  console.log("selectedMonth", selectedMonth.value);
  let [monthf, yearf] = selectedMonth.value.split("-");
  monthf = monthf.padStart(2, "0");
  selectedMonth.value = `${monthf}-${yearf}`;
  console.log("selectedMonth", selectedMonth.value);

  const responseTotal1 = await axios.post(
    API_ENDPOINTS.GET_ALL_REVENUE_BY_TIME_MONTH,
    {
      date: selectedMonth.value,
    }
  );
  totalRevenueOrderCurrentMonth.value = responseTotal1.data;
  console.log(
    "totalRevenueOrderCurrentMonth",
    totalRevenueOrderCurrentMonth.value
  );
  totalRevenue.value =
    totalRevenueOrderCurrentMonth.value.totalAmountCurrentMonth;
  totalRevenueYesterday.value =
    totalRevenueOrderCurrentMonth.value.totalAmountLastMonth;
  totalOrders.value =
    totalRevenueOrderCurrentMonth.value.totalOrdersCurrentMonth;
  totalOrdersYesterday.value =
    totalRevenueOrderCurrentMonth.value.totalOrdersLastMonth;
}
async function selectDayAndCallAPI(day) {
  selectedDay.value = day;
  console.log("selectedDay", selectedDay.value);
  let [dayf, monthf, yearf] = selectedDay.value.split("-");
  dayf = dayf.padStart(2, "0");
  monthf = monthf.padStart(2, "0");
  selectedDay.value = `${dayf}-${monthf}-${yearf}`;
  console.log("formatted selectedDay", selectedDay.value); // Kết quả: "02-11-2024"
  const responseTotal1 = await axios.post(
    API_ENDPOINTS.GET_ALL_REVENUE_BY_TIME,
    {
      date: selectedDay.value,
    }
  );
  totalRevenueOrderCurrentDay.value = responseTotal1.data;
  console.log("totalRevenueOrderCurrentDay", totalRevenueOrderCurrentDay.value);
  totalRevenue.value = totalRevenueOrderCurrentDay.value.totalAmount;
  totalRevenueYesterday.value =
    totalRevenueOrderCurrentDay.value.totalAmountYesterday;
  totalOrders.value = totalRevenueOrderCurrentDay.value.totalOrders;
  totalOrdersYesterday.value =
    totalRevenueOrderCurrentDay.value.totalOrdersYesterday;
}
async function selectCurrentDayAndCallAPI() {
  const day = currentDate.getDate();
  // Định dạng lại thành "ngày/tháng/năm"
  const formattedDate = `${day < 10 ? "0" + day : day}-${
    currentMonth < 10 ? "0" + currentMonth : currentMonth
  }-${currentYear}`;
  selectedCurrentDay.value = formattedDate;
  console.log("selectedCurrentDay", selectedCurrentDay.value);
  let [dayf, monthf, yearf] = selectedCurrentDay.value.split("-");
  dayf = dayf.padStart(2, "0");
  monthf = monthf.padStart(2, "0");
  selectedCurrentDay.value = `${dayf}-${monthf}-${yearf}`;
  console.log("formatted selectedCurrentDay", selectedCurrentDay.value); // Kết quả: "02-11-2024"

  const responseTotal1 = await axios.post(
    API_ENDPOINTS.GET_ALL_REVENUE_BY_TIME,
    {
      date: selectedCurrentDay.value,
    }
  );
  totalRevenueOrderCurrentDay.value = responseTotal1.data;
  console.log("totalRevenueOrderCurrentDay", totalRevenueOrderCurrentDay.value);
  totalRevenue.value = totalRevenueOrderCurrentDay.value.totalAmount;
  totalRevenueYesterday.value =
    totalRevenueOrderCurrentDay.value.totalAmountYesterday;
  totalOrders.value = totalRevenueOrderCurrentDay.value.totalOrders;
  totalOrdersYesterday.value =
    totalRevenueOrderCurrentDay.value.totalOrdersYesterday;
}

const previousDay = computed(() => {
  if (!selectedDay.value) return "";
  const [day, month, year] = selectedDay.value.split("-").map(Number);
  const currentDate = new Date(year, month - 1, day); // Chuyển đổi thành đối tượng Date
  currentDate.setDate(currentDate.getDate() - 1); // Trừ một ngày
  const previousDay = currentDate.getDate().toString().padStart(2, "0"); // Đảm bảo có 2 chữ số
  const previousMonth = (currentDate.getMonth() + 1)
    .toString()
    .padStart(2, "0"); // Đảm bảo có 2 chữ số
  const previousYear = currentDate.getFullYear(); // Năm không cần định dạng
  return `${previousDay}-${previousMonth}-${previousYear}`;
});
const previousMonth = computed(() => {
  if (!selectedMonth.value) return "";
  const [month, year] = selectedMonth.value.split("-").map(Number);
  const currentDate = new Date(year, month - 1, 1); // Tạo đối tượng Date với ngày đầu tháng
  currentDate.setMonth(currentDate.getMonth() - 1); // Trừ một tháng

  const previousMonth = currentDate.getMonth() + 1; // Tháng (tăng 1 vì tháng bắt đầu từ 0)
  const previousYear = currentDate.getFullYear(); // Năm

  return `${previousMonth}-${previousYear}`;
});
const previousCurrentDay = computed(() => {
  if (!selectedCurrentDay.value) return "";
  const [day, month, year] = selectedCurrentDay.value.split("-").map(Number);
  const currentDate = new Date(year, month - 1, day); // Chuyển đổi thành đối tượng Date
  currentDate.setDate(currentDate.getDate() - 1); // Trừ một ngày
  const previousDay = currentDate.getDate().toString().padStart(2, "0"); // Đảm bảo có 2 chữ số
  const previousMonth = (currentDate.getMonth() + 1)
    .toString()
    .padStart(2, "0"); // Đảm bảo có 2 chữ số
  const previousYear = currentDate.getFullYear(); // Năm không cần định dạng
  return `${previousDay}-${previousMonth}-${previousYear}`;
});

const calculateRevenuePercentage = computed(() => {
  if (totalRevenue.value == 0 && totalRevenueYesterday.value == 0) {
    return 0;
  } else if (totalRevenue.value != 0 && totalRevenueYesterday.value == 0) {
    return 100;
  } else if (totalRevenue.value == 0 && totalRevenueYesterday.value != 0) {
    return 100;
  }
  if (totalRevenue.value > totalRevenueYesterday.value) {
    return totalRevenue.value / totalRevenueYesterday.value;
  } else {
    return totalRevenueYesterday.value / totalRevenue.value;
  }
});
const calculateOrderPercentage = computed(() => {
  if (totalOrders.value == 0 && totalOrdersYesterday.value == 0) {
    return 0;
  } else if (totalOrders.value != 0 && totalOrdersYesterday.value == 0) {
    return 100;
  } else if (totalOrders.value == 0 && totalOrdersYesterday.value != 0) {
    return 100;
  }
  if (totalOrders.value > totalOrdersYesterday.value) {
    return totalOrders.value / totalOrdersYesterday.value;
  } else {
    return totalOrdersYesterday.value / totalOrders.value;
  }
});
const resetTimeFillterRevenueOrder = () => {
  selectedDay.value = "";
  selectedMonth.value = "";
  selectedCurrentDay.value = "";
};

const headersEmployee = ref([
  { title: "Tên Nhân Viên", key: "fullName", width: "35%" },
  { title: "Tổng doanh thu", key: "totalRevenue", width: "65%" },
]);
const headersCategory = ref([
  { title: "Tên Danh mục", key: "categoryName", width: "35%" },
  { title: "Tổng doanh thu", key: "totalRevenue", width: "65%" },
]);

async function init() {
  // Lọc danh thu theo nhân viên
  const responseRevenue = await axios.post(
    API_ENDPOINTS.GET_ALL_REVENUE_BY_EMPLOYEE_AND_TIME_MONTH, {
      date: `${currentMonth}-${currentYear}`,
    }
  );
  if (responseRevenue) {
    filteredTotalRevenueForEmployee.value = responseRevenue.data.sort(
      (a, b) => b.totalRevenue - a.totalRevenue
    );
  }
  const totalRevenueMaxDataTable = filteredTotalRevenueForEmployee.value
    ? filteredTotalRevenueForEmployee.value.reduce((max, current) => {
        return current.totalRevenue > max.totalRevenue ? current : max;
      }, filteredTotalRevenueForEmployee.value[0])
    : null;
  totalRevenueMax.value = totalRevenueMaxDataTable
    ? totalRevenueMaxDataTable.totalRevenue
    : 0;

  // Lọc doanh thu theo doanh mục
  const responseRevenueForCategory = await axios.post(
    API_ENDPOINTS.GET_ALL_REVENUE_BY_CATEGORY_AND_TIME_MONTH, {
      date: `${currentMonth}-${currentYear}`,
    }
  );
  if (responseRevenueForCategory) {
    filteredTotalRevenueForCategory.value =
      responseRevenueForCategory.data.sort(
        (a, b) => b.totalRevenue - a.totalRevenue
      );
  }
  const totalRevenueForCategoryMaxDataTable =
    filteredTotalRevenueForCategory.value
      ? filteredTotalRevenueForCategory.value.reduce((max, current) => {
          return current.totalRevenue > max.totalRevenue ? current : max;
        }, filteredTotalRevenueForCategory.value[0])
      : null;
  totalRevenueForCategoryMax.value = totalRevenueForCategoryMaxDataTable
    ? totalRevenueForCategoryMaxDataTable.totalRevenue
    : 0;

  loading.value = false;
}
init();

// Xử lý ở phần NHÂN VIÊN
async function selectDayAndCallAPIForEmployee(day) {
  loading.value = true;
  selectedDayForEmp.value = day;
  console.log("selectedDayForEmp", selectedDayForEmp.value);
  let [dayf, monthf, yearf] = selectedDayForEmp.value.split("-");
  dayf = dayf.padStart(2, "0");
  monthf = monthf.padStart(2, "0");
  selectedDayForEmp.value = `${dayf}-${monthf}-${yearf}`;
  console.log("formatted selectedDayForEmp", selectedDayForEmp.value); // Kết quả: "02-11-2024"
  const responseTotal1 = await axios.post(
    API_ENDPOINTS.GET_ALL_REVENUE_BY_EMPLOYEE_AND_TIME,
    {
      date: selectedDayForEmp.value,
    }
  );
  if (responseTotal1) {
    filteredTotalRevenueForEmployee.value = responseTotal1.data.sort(
      (a, b) => b.totalRevenue - a.totalRevenue
    );
  }
  const totalRevenueMaxDataTable = filteredTotalRevenueForEmployee.value
    ? filteredTotalRevenueForEmployee.value.reduce((max, current) => {
        return current.totalRevenue > max.totalRevenue ? current : max;
      }, filteredTotalRevenueForEmployee.value[0])
    : null;
  totalRevenueMax.value = totalRevenueMaxDataTable
    ? totalRevenueMaxDataTable.totalRevenue
    : 0;
  loading.value = false;
}
async function selectMonthAndCallAPIForEmployee(month) {
  loading.value = true;
  selectedMonthForEmp.value = month;
  console.log("selectedMonthForEmp", selectedMonthForEmp.value);
  let [monthf, yearf] = selectedMonthForEmp.value.split("-");
  monthf = monthf.padStart(2, "0");
  selectedMonthForEmp.value = `${monthf}-${yearf}`;
  console.log("selectedMonthForEmp", selectedMonthForEmp.value);

  const responseTotal1 = await axios.post(
    API_ENDPOINTS.GET_ALL_REVENUE_BY_EMPLOYEE_AND_TIME_MONTH,
    {
      date: selectedMonthForEmp.value,
    }
  );
  if (responseTotal1) {
    filteredTotalRevenueForEmployee.value = responseTotal1.data.sort(
      (a, b) => b.totalRevenue - a.totalRevenue
    );
  }
  const totalRevenueMaxDataTable = filteredTotalRevenueForEmployee.value
    ? filteredTotalRevenueForEmployee.value.reduce((max, current) => {
        return current.totalRevenue > max.totalRevenue ? current : max;
      }, filteredTotalRevenueForEmployee.value[0])
    : null;
  totalRevenueMax.value = totalRevenueMaxDataTable
    ? totalRevenueMaxDataTable.totalRevenue
    : 0;
  loading.value = false;
}
const resetTimeFillterRevenueOrderForEmployee = () => {
  selectedDayForEmp.value = "";
  selectedMonthForEmp.value = "";
  init();
};

// Xử lý ở nhần DANH MỤC
async function selectDayAndCallAPIForCategory(day) {
  loading.value = true;
  selectedDayForCate.value = day;
  console.log("selectedDayForCate", selectedDayForCate.value);
  let [dayf, monthf, yearf] = selectedDayForCate.value.split("-");
  dayf = dayf.padStart(2, "0");
  monthf = monthf.padStart(2, "0");
  selectedDayForCate.value = `${dayf}-${monthf}-${yearf}`;
  console.log("formatted selectedDayForCate", selectedDayForCate.value); // Kết quả: "02-11-2024"
  const responseTotal1 = await axios.post(
    API_ENDPOINTS.GET_ALL_REVENUE_BY_CATEGORY_AND_TIME,
    {
      date: selectedDayForCate.value,
    }
  );
  console.log("responseTotal1.data", responseTotal1.data);
  if (responseTotal1) {
    filteredTotalRevenueForCategory.value = responseTotal1.data.sort(
      (a, b) => b.totalRevenue - a.totalRevenue
    );
  }
  const totalRevenueForCategoryMaxDataTable =
    filteredTotalRevenueForCategory.value
      ? filteredTotalRevenueForCategory.value.reduce((max, current) => {
          return current.totalRevenue > max.totalRevenue ? current : max;
        }, filteredTotalRevenueForCategory.value[0])
      : null;
  totalRevenueForCategoryMax.value = totalRevenueForCategoryMaxDataTable
    ? totalRevenueForCategoryMaxDataTable.totalRevenue
    : 0;
  loading.value = false;
}
async function selectMonthAndCallAPIForCategory(month) {
  loading.value = true;
  selectedMonthForCate.value = month;
  console.log("selectedMonthForCate", selectedMonthForCate.value);
  let [monthf, yearf] = selectedMonthForCate.value.split("-");
  monthf = monthf.padStart(2, "0");
  selectedMonthForCate.value = `${monthf}-${yearf}`;
  console.log("selectedMonthForCate", selectedMonthForCate.value);

  const responseTotal1 = await axios.post(
    API_ENDPOINTS.GET_ALL_REVENUE_BY_CATEGORY_AND_TIME_MONTH,
    {
      date: selectedMonthForCate.value,
    }
  );
  console.log("responseTotal1.data", responseTotal1.data);
  if (responseTotal1) {
    filteredTotalRevenueForCategory.value = responseTotal1.data.sort(
      (a, b) => b.totalRevenue - a.totalRevenue
    );
  }
  const totalRevenueForCategoryMaxDataTable =
    filteredTotalRevenueForCategory.value
      ? filteredTotalRevenueForCategory.value.reduce((max, current) => {
          return current.totalRevenue > max.totalRevenue ? current : max;
        }, filteredTotalRevenueForCategory.value[0])
      : null;
  totalRevenueForCategoryMax.value = totalRevenueForCategoryMaxDataTable
    ? totalRevenueForCategoryMaxDataTable.totalRevenue
    : 0;
  loading.value = false;
}
const resetTimeFillterRevenueOrderForCategory = () => {
  selectedDayForCate.value = "";
  selectedMonthForCate.value = "";
  init();
};
const formatCurencyFromApiToView = (time) => {
  return `${time.toLocaleString("vi-VN")} VND`;
};
</script>
