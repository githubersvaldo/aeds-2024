int n = 20;
int[] array = new int[n]; 
int i = -1, j = -1, minIdx = -1;

void setup() {
  size(800, 600);
  for(int k = 0; k < array.length; k++) array[k] = (int) random(height);
  thread("ordenar");
}

void draw() {
  background(220);
  int l = width / n;
  for (int k = 0; k < n; k++) {
    int h = int(array[k]);
    if(k == i || k == j || k == minIdx) fill(100, 250, 100);
    else fill(100, 100, 250);
    rect(k * l, height - h, l, h);
    fill(0);
    textAlign(CENTER);
    text(str(n), n * l, height - h - 10, l, h);
  }
  
  if(mousePressed){
    for(int k = 0; k < array.length; k++) array[k] = (int) random(height);
  }
  
}

void ordenar() {   
  while(true) quickSort(array);    
}

// Bubble Sort
void bubbleSort(int[] arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    for (j = 0; j < arr.length - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        // Troca os elementos
        delay(300);
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
  // Complexidade de tempo: O(n^2)
}

// Selection Sort
void selectionSort(int[] arr) {
  for (int i = 0; i < arr.length - 1; i++) {
    minIdx = i;
    delay(100);
    for (j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[minIdx]) {
        minIdx = j;
        delay(100);
      }
    }
    
    // Troca o menor elemento encontrado com o primeiro elemento
    int temp = arr[minIdx];
    arr[minIdx] = arr[i];
    arr[i] = temp;
    delay(300);
  }
  // Complexidade de tempo: O(n^2)
}

// Insertion Sort
void insertionSort(int[] arr) {
  for (i = 1; i < arr.length; i++) {
    int valor = arr[i];
    j = i - 1;
    delay(100);
    while (j >= 0 && arr[j] > valor) {
      arr[j + 1] = arr[j];
      j = j - 1;
      delay(100);
    }
    arr[j + 1] = valor;
    delay(100);
  }
  // Complexidade de tempo: O(n^2)
}

void mergeSort(int[] arr){
  mergeSort(arr, 0, arr.length - 1); 
}
// Merge Sort
void mergeSort(int[] arr, int l, int r) {
  if (l < r) {
    int m = l + (r - l) / 2;
    mergeSort(arr, l, m);
    mergeSort(arr, m + 1, r);
    delay(100);
    merge(arr, l, m, r);
    
  }
  // Complexidade de tempo: O(n log n)
}

void merge(int[] arr, int l, int m, int r) {
  // Cria arrays temporários
  int[] L = new int[m - l + 1];
  int[] R = new int[r - m];
  
  // Copia os dados para os arrays temporários
  for (int i = 0; i < L.length; ++i) L[i] = arr[l + i];
  for (int j = 0; j < R.length; ++j) R[j] = arr[m + 1 + j];
  
  // Mescla os arrays temporários
  i = 0;
  j = 0;
  int k = l;
  
  while (i < L.length && j < R.length) {
    if (L[i] <= R[j]) {
      arr[k] = L[i];
      i++;
    } else {
      arr[k] = R[j];
      j++;
    }
    k++;
  }
  // Copia os elementos restantes de L[], se houver
  while (i < L.length) {
    arr[k] = L[i];
    i++;
    k++;
  }
  // Copia os elementos restantes de R[], se houver
  while (j < R.length) {
    arr[k] = R[j];
    j++;
    k++;
  }
}

// QuickSort
void quickSort(int[] arr){
  quickSort(arr, 0, arr.length - 1);
}

void quickSort(int[] arr, int low, int high) {
  if (low < high) {
    // Particiona o array
    int pi = partition(arr, low, high);
    // Ordena recursivamente as duas partições
    quickSort(arr, low, pi - 1);
    quickSort(arr, pi + 1, high);
  }
  // Complexidade de tempo: O(n log n) em média, mas O(n^2) no pior caso.
}

int partition(int[] arr, int low, int high) {
  // Escolhe o último elemento como pivô
  int pivot = arr[high];  
  i = (low - 1); // Índice do menor elemento

  for (j = low; j < high; j++) {
    // Se o elemento atual for menor que o pivô
    if (arr[j] < pivot) {
      i++;
      // Troca arr[i] e arr[j]
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
      delay(100);
    }
  }

  // Troca arr[i+1] e arr[high] (ou pivô)
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;
  delay(100);

  return i + 1; // Retorna o índice de particionamento
}




  
