void setup () {
   size(800, 600);
   textFont(createFont("Georgia", 36));
   noLoop();
}

void draw() {
  background(0);
  
  int x0= 0;
  int x1= 2;
  int x2= 3;
  int x3= 5;
  int x4= 7;
  int x5= 8;
  int x6= 10;
  
  int y0= 0;
  int y1= 3;
  int y2= 5;
  int y3= 5;
  int y4= 5;
  int y5= 7;
  int y6= 10;
  
  textSize(20);
  stroke(160);
  text("Polinomio interpolante de:", 20, 40);
  text("f(" + x0 + ") = " + y0, 50, 65);
  text("f(" + x1 + ") = " + y1, 50, 90);
  text("f(" + x2 + ") = " + y2, 50, 115);
  text("f(" + x3 + ") = " + y3, 50, 140);
  text("f(" + x4 + ") = " + y4, 50, 165);
  text("f(" + x5 + ") = " + y5, 50, 190);
  text("f(" + x6 + ") = " + y6, 50, 215);
  
  float lb0 = (x0 - x1)*(x0 - x2)*(x0 - x3)*(x0 - x4)*(x0 - x5)*(x0 - x6);
  float lb1 = (x1 - x0)*(x1 - x2)*(x1 - x3)*(x1 - x4)*(x1 - x5)*(x1 - x6);
  float lb2 = (x2 - x0)*(x2 - x1)*(x2 - x3)*(x2 - x4)*(x2 - x5)*(x2 - x6);
  float lb3 = (x3 - x0)*(x3 - x1)*(x3 - x2)*(x3 - x4)*(x3 - x5)*(x3 - x6);
  float lb4 = (x4 - x0)*(x4 - x1)*(x4 - x2)*(x4 - x3)*(x4 - x5)*(x4 - x6);
  float lb5 = (x5 - x0)*(x5 - x1)*(x5 - x2)*(x5 - x3)*(x5 - x4)*(x5 - x6);
  float lb6 = (x6 - x0)*(x6 - x1)*(x6 - x2)*(x6 - x3)*(x6 - x4)*(x6 - x5);
  
  float[] lb = {lb0, lb1, lb2, lb3, lb4, lb5, lb6};
  //Término independiente:
  float t_i = (y0*x1*x2*x3*x4*x5*x6)/lb[0] + (y1*x0*x2*x3*x4*x5*x6)/lb[1] +
  (y2*x1*x0*x3*x4*x5*x6)/lb[2] + (y3*x1*x2*x0*x4*x5*x6)/lb[3] + 
  (y4*x1*x2*x3*x0*x5*x6)/lb[4] + (y5*x1*x2*x3*x4*x0*x6)/lb[5] +
  (y6*x1*x2*x3*x4*x5*x0)/lb[6];  
  
  text("Término independiente: " + t_i ,70, 250);
  //coeficiente c_1:
  float c10 = y0*(x1*x2*x3*x4*x5 + x1*x2*x3*x4*x6 + x1*x2*x3*x5*x6 + x1*x2*x4*x5*x6
  + x1*x3*x4*x5*x6 + x2*x3*x4*x5*x6);
  float c11 = y1*(x0*x2*x3*x4*x5 + x0*x2*x3*x4*x6 + x0*x2*x3*x5*x6 + x0*x2*x4*x5*x6 + 
  x0*x3*x4*x5*x6 + x2*x3*x4*x5*x6);
  float c12 = y2*(x0*x1*x3*x4*x5 + x0*x1*x3*x4*x6 + x0*x1*x3*x5*x6 + x0*x1*x4*x5*x6 + 
  x0*x3*x4*x5*x6 + x1*x3*x4*x5*x6);
  float c13 = y3*(x0*x1*x2*x4*x5 + x0*x1*x2*x4*x6 + x0*x1*x2*x5*x6 + x0*x1*x4*x5*x6 + 
  x0*x2*x4*x5*x6 + x1*x2*x4*x5*x6);
  float c14 = y4*(x0*x1*x2*x3*x5 + x0*x1*x2*x3*x6 + x0*x1*x2*x5*x6 + x0*x1*x3*x5*x6 + 
  x0*x2*x3*x5*x6 + x1*x2*x3*x5*x6);
  float c15 = y5*(x0*x1*x2*x3*x4 + x0*x1*x2*x3*x6 + x0*x1*x2*x4*x6 + x0*x1*x3*x4*x6 + 
  x0*x2*x3*x4*x6 + x1*x2*x3*x4*x6);
  float c16 = y6*(x0*x1*x2*x3*x4 + x0*x1*x2*x3*x5 + x0*x1*x2*x4*x5 + x0*x1*x3*x4*x5 + 
  x0*x2*x3*x4*x5 + x1*x2*x3*x4*x5);
  
  float [] c1 = {c10, c11, c12, c13, c14, c15, c16};
  
  float c_1 = - (c1[0] + c1[1] + c1[2] + c1[3] + c1[4] + c1[5] + c1[6]);
  text("C1: - (              +              +              +              +              +              +              )", 70, 290);
  
  EscribirT(c1, lb, 280);
  
  //coeficiente c_2:
  float c20 = y0*(x1*x2*x3*x4 + x1*x2*x3*x5 + x1*x2*x3*x6 + x1*x2*x4*x5 +
  x1*x2*x4*x6 + x1*x2*x5*x6 + x1*x3*x4*x5 + x1*x3*x4*x6 + x1*x3*x5*x6 +
  x1*x4*x5*x6 + x2*x3*x4*x5 + x2*x3*x4*x6 + x2*x3*x5*x6 + x2*x4*x5*x6 +
  x3*x4*x5*x6); 
  float c21 = y1*(x0*x2*x3*x4 + x0*x2*x3*x5 + x0*x2*x3*x6 + x0*x2*x4*x5 + 
  x0*x2*x4*x6 + x0*x2*x5*x6 + x0*x3*x4*x5 + x0*x3*x4*x6 + x0*x3*x5*x6 + 
  x0*x4*x5*x6 + x2*x3*x4*x5 + x2*x3*x4*x6 + x2*x3*x5*x6 + x2*x4*x5*x6 +
  x3*x4*x5*x6);
  float c22 = y2*(x0*x1*x3*x4 + x0*x1*x3*x5 + x0*x1*x3*x6 + x0*x1*x4*x5 + 
  x0*x1*x4*x6 + x0*x1*x5*x6 + x0*x3*x4*x5 + x0*x3*x4*x6 + x0*x3*x5*x6 + 
  x0*x4*x5*x6 + x1*x3*x4*x5 + x1*x3*x4*x6 + x1*x3*x5*x6 + x1*x4*x5*x6 + 
  x3*x4*x5*x6);
  float c23 = y3*(x0*x1*x2*x4 + x0*x1*x2*x5 + x0*x1*x2*x6 + x0*x1*x4*x5 + 
  x0*x1*x4*x6 + x0*x1*x5*x6 + x0*x2*x4*x5 + x0*x2*x4*x6 + x0*x2*x5*x6 + 
  x0*x4*x5*x6 + x1*x2*x4*x5 + x1*x2*x4*x6 + x1*x2*x5*x6 + x1*x4*x5*x6 + 
  x2*x4*x5*x6);
  float c24 = y4*(x0*x1*x2*x3 + x0*x1*x2*x5 + x0*x1*x2*x6 + x0*x1*x3*x5 + 
  x0*x1*x3*x6 + x0*x1*x5*x6 + x0*x2*x3*x5 + x0*x2*x3*x6 + x0*x2*x5*x6 + 
  x0*x3*x5*x6 + x1*x2*x3*x5 + x1*x2*x3*x6 + x1*x2*x5*x6 + x1*x3*x5*x6 + 
  x2*x3*x5*x6);
  float c25 = y5*(x0*x1*x2*x3 + x0*x1*x2*x4 + x0*x1*x2*x6 + x0*x1*x3*x4 + 
  x0*x1*x3*x6 + x0*x1*x4*x6 + x0*x2*x3*x4 + x0*x2*x3*x6 + x0*x2*x4*x6 + 
  x0*x3*x4*x6 + x1*x2*x3*x4 + x1*x2*x3*x6 + x1*x2*x4*x6 + x1*x3*x4*x6 + 
  x2*x3*x4*x6);
  float c26 = y6*(x0*x1*x2*x3 + x0*x1*x2*x4 + x0*x1*x2*x5 + x0*x1*x3*x4 + 
  x0*x1*x3*x5 + x0*x1*x4*x5 + x0*x2*x3*x4 + x0*x2*x3*x5 + x0*x2*x4*x5 + 
  x0*x3*x4*x5 + x1*x2*x3*x4 + x1*x2*x3*x5 + x1*x2*x4*x5 + x1*x3*x4*x5 + 
  x2*x3*x4*x5);
  
  float [] c2 = {c20, c21, c22, c23, c24, c25, c26};
  
  float c_2 = c2[0] + c2[1] + c2[2] + c2[3] + c2[4] + c2[5] + c2[6];
  text("C2:   (              +              +              +              +              +              +              )", 70, 340);
  
  EscribirT(c2, lb, 330);
  
  //Coeficiente c_3:
  float c30 = y0*(x1*x2*x3 + x1*x2*x4 + x1*x2*x5 + x1*x2*x6 + x1*x3*x4 + x1*x3*x5 + 
  x1*x3*x6 + x1*x4*x5 + x1*x4*x6 + x1*x5*x6 + x2*x3*x4 + x2*x3*x5 + x2*x3*x6 + 
  x2*x4*x5 + x2*x4*x6 + x2*x5*x6 + x3*x4*x5 + x3*x4*x6 + x3*x5*x6 + x4*x5*x6);
  float c31 = y1*(x0*x2*x3 + x0*x2*x4 + x0*x2*x5 + x0*x2*x6 + x0*x3*x4 + x0*x3*x5 + 
  x0*x3*x6 + x0*x4*x5 + x0*x4*x6 + x0*x5*x6 + x2*x3*x4 + x2*x3*x5 + x2*x3*x6 + 
  x2*x4*x5 + x2*x4*x6 + x2*x5*x6 + x3*x4*x5 + x3*x4*x6 + x3*x5*x6 + x4*x5*x6);
  float c32 = y2*(x0*x1*x3 + x0*x1*x4 + x0*x1*x5 + x0*x1*x6 + x0*x3*x4 + x0*x3*x5 + 
  x0*x3*x6 + x0*x4*x5 + x0*x4*x6 + x0*x5*x6 + x1*x3*x4 + x1*x3*x5 + x1*x3*x6 + 
  x1*x4*x5 + x1*x4*x6 + x1*x5*x6 + x3*x4*x5 + x3*x4*x6 + x3*x5*x6 + x4*x5*x6);
  float c33 = y3*(x0*x1*x2 + x0*x1*x4 + x0*x1*x5 + x0*x1*x6 + x0*x2*x4 + x0*x2*x5 + 
  x0*x2*x6 + x0*x4*x5 + x0*x4*x6 + x0*x5*x6 + x1*x2*x4 + x1*x2*x5 + x1*x2*x6 + 
  x1*x4*x5 + x1*x4*x6 + x1*x5*x6 + x2*x4*x5 + x2*x4*x6 + x2*x5*x6 + x4*x5*x6);
  float c34 = y4*(x0*x1*x2 + x0*x1*x3 + x0*x1*x5 + x0*x1*x6 + x0*x2*x3 + x0*x2*x5 + 
  x0*x2*x6 + x0*x3*x5 + x0*x3*x6 + x0*x5*x6 + x1*x2*x3 + x1*x2*x5 + x1*x2*x6 + 
  x1*x3*x5 + x1*x3*x6 + x1*x5*x6 + x2*x3*x5 + x2*x3*x6 + x2*x5*x6 + x3*x5*x6);
  float c35 = y5*(x0*x1*x2 + x0*x1*x3 + x0*x1*x4 + x0*x1*x6 + x0*x2*x3 + x0*x2*x4 + 
  x0*x2*x6 + x0*x3*x4 + x0*x3*x6 + x0*x4*x6 + x1*x2*x3 + x1*x2*x4 + x1*x2*x6 + 
  x1*x3*x4 + x1*x3*x6 + x1*x4*x6 + x2*x3*x4 + x2*x3*x6 + x2*x4*x6 + x3*x4*x6);
  float c36 = y6*(x0*x1*x2 + x0*x1*x3 + x0*x1*x4 + x0*x1*x5 + x0*x2*x3 + x0*x2*x4 + 
  x0*x2*x5 + x0*x3*x4 + x0*x3*x5 + x0*x4*x5 + x1*x2*x3 + x1*x2*x4 + x1*x2*x5 + 
  x1*x3*x4 + x1*x3*x5 + x1*x4*x5 + x2*x3*x4 + x2*x3*x5 + x2*x4*x5 + x3*x4*x5);
  
  float [] c3 = {c30, c31, c32, c33, c34, c35, c36};
  text("C3: - (              +              +              +              +              +              +              )", 70, 390);
  
  EscribirT(c3, lb, 380);
  
  //Coeficiente c_4:
  float c40 = y0*(x1*x2 + x1*x3 + x1*x4 + x1*x5 + x1*x6 + x2*x3 + x2*x4 + x2*x5 +
  x2*x6 + x3*x4 + x3*x5 + x3*x6 + x4*x5 + x4*x6 + x5*x6);
  float c41 = y1*(x0*x2 + x0*x3 + x0*x4 + x0*x5 + x0*x6 + x2*x3 + x2*x4 + x2*x5 + 
  x2*x6 + x3*x4 + x3*x5 + x3*x6 + x4*x5 + x4*x6 + x5*x6);
  float c42 = y2*(x0*x1 + x0*x3 + x0*x4 + x0*x5 + x0*x6 + x1*x3 + x1*x4 + x1*x5 + 
  x1*x6 + x3*x4 + x3*x5 + x3*x6 + x4*x5 + x4*x6 + x5*x6);
  float c43 = y3*(x0*x1 + x0*x2 + x0*x4 + x0*x5 + x0*x6 + x1*x2 + x1*x4 + x1*x5 + 
  x1*x6 + x2*x4 + x2*x5 + x2*x6 + x4*x5 + x4*x6 + x5*x6);
  float c44 = y4*(x0*x1 + x0*x2 + x0*x3 + x0*x5 + x0*x6 + x1*x2 + x1*x3 + x1*x5 + 
  x1*x6 + x2*x3 + x2*x5 + x2*x6 + x3*x5 + x3*x6 + x5*x6);
  float c45 = y5*(x0*x1 + x0*x2 + x0*x3 + x0*x4 + x0*x6 + x1*x2 + x1*x3 + x1*x4 + 
  x1*x6 + x2*x3 + x2*x4 + x2*x6 + x3*x4 + x3*x6 + x4*x6);
  float c46 = y6*(x0*x1 + x0*x2 + x0*x3 + x0*x4 + x0*x5 + x1*x2 + x1*x3 + x1*x4 + 
  x1*x5 + x2*x3 + x2*x4 + x2*x5 + x3*x4 + x3*x5 + x4*x5);
  
  float [] c4 = {c40, c41, c42, c43, c44, c45, c46};
  text("C4:   (              +              +              +              +              +              +              )", 70, 440);
  
  EscribirT(c4, lb, 430);
  
  //Coeficiente c_5:
  float c50 = y0*(x1+x2+x3+x4+x5+x6);
  float c51 = y1*(x0+x2+x3+x4+x5+x6);
  float c52 = y2*(x1+x0+x3+x4+x5+x6);
  float c53 = y3*(x1+x2+x0+x4+x5+x6);
  float c54 = y4*(x1+x2+x3+x0+x5+x6);
  float c55 = y5*(x1+x2+x3+x4+x0+x6);
  float c56 = y6*(x1+x2+x3+x4+x5+x0);
  
  float [] c5 = {c50, c51, c52, c53, c54, c55, c56};
  text("C5: - (              +              +              +              +              +              +              )", 70, 490);
  
  EscribirT(c5, lb, 480);
  
  //Coeficiente c_6:
  float [] c6 = {y0, y1, y2, y3, y4, y5, y6};
  text("C6:   (              +              +              +              +              +              +              )", 70, 540);
  
  EscribirT(c6, lb, 530);
  
  //Operar...
  Oper(c1, lb, 450, 40);
  text("C1: - ", 400, 50);
  Oper(c2, lb, 450, 80);
  text("C2:   ", 400, 90);
  Oper(c3, lb, 450, 120);
  text("C3: - ", 400, 130);
  Oper(c4, lb, 600, 40);
  text("C4:   ", 550, 50);
  Oper(c5, lb, 600, 80);
  text("C5: - ", 550, 90);
  Oper(c6, lb, 600, 120);
  text("C6:   ", 550, 130);
}

float[] Simplificar(float num, float dem) {
  float[] sal = {num, dem};
  if (num == 0) return sal;
  float top = 0;
  if (abs(num) < abs(dem)) {
    top = abs(dem);
  } else {
    top = abs(num);
  }
  float num_r = num;
  float dem_r = dem;
  for (int i = 2; i <= sqrt(top); i++) {
    if (num_r % i == 0) {
      if (dem_r % i == 0) {
        num_r = num_r/i;
        dem_r = dem_r/i;
        i = 1;
      }
    }
  }
  if (num_r < 0 & dem_r < 0) {
   num_r = abs(num_r);
   dem_r = abs(dem_r); 
  }
  sal[0] = num_r;
  sal[1] = dem_r;
 return sal; 
}

void EscribirT(float[] priTer, float[] segTer, int altura) {
  textSize(12);
  float[] a = Simplificar(priTer[0], segTer[0]);
  float[] b = Simplificar(priTer[1], segTer[1]);
  float[] c = Simplificar(priTer[2], segTer[2]);
  float[] d = Simplificar(priTer[3], segTer[3]);
  float[] e = Simplificar(priTer[4], segTer[4]);
  float[] f = Simplificar(priTer[5], segTer[5]);
  float[] g = Simplificar(priTer[6], segTer[6]);
  
  text(a[0], 125 +80*0, altura);
  text(b[0], 125 +80*1, altura);
  text(c[0], 125 +80*2, altura);
  text(d[0], 125 +80*3, altura);
  text(e[0], 125 +80*4, altura);
  text(f[0], 125 +80*5, altura);
  text(g[0], 125 +80*6, altura);
  
  for (int i = 0; i <= 6; i++) {
    line(125+80*i + 3,altura+5, 125 + 60+80*i,altura+5);
  }
  
  text(a[1], 125 +80*0, altura+18);
  text(b[1], 125 +80*1, altura+18);
  text(c[1], 125 +80*2, altura+18);
  text(d[1], 125 +80*3, altura+18);
  text(e[1], 125 +80*4, altura+18);
  text(f[1], 125 +80*5, altura+18);
  text(g[1], 125 +80*6, altura+18);
  
  /*
  for (int i = 0; i <= 6; i++) {
    float[] par[i] = Simplificar(priTer[i], segTer[i]);
    text(par[i][0], altura +80*i, 280);
    line(altura+80*i + 3,285, altura + 60+80*i,285);
    text(par[i][1], altura+80*i, 298);
  }
  */
  
  textSize(20);
}

float[] Sumfrac(float num1, float dem1, float num2, float dem2) {
  if (num1 == 0) dem1 = 1;
  if (num2 == 0) dem2 = 1;
 float num = num1*dem2 + num2*dem1;
 float dem = dem1 * dem2;
 float[] a = Simplificar(num, dem);
 return a; 
}

void Oper(float[] nums, float[] dems, int ancho, int altura) {
  float[] sum1 = Sumfrac(nums[0], dems[0], nums[1], dems[1]);
  float[] sum2 = Sumfrac(sum1[0], sum1[1], nums[2], dems[2]);
  float[] sum3 = Sumfrac(sum2[0], sum2[1], nums[3], dems[3]);
  float[] sum4 = Sumfrac(sum3[0], sum3[1], nums[4], dems[4]);
  float[] sum5 = Sumfrac(sum4[0], sum4[1], nums[5], dems[5]);
  float[] sum6 = Sumfrac(sum5[0], sum5[1], nums[6], dems[6]);
  textSize(12);
  text(sum6[0], ancho, altura);
  line(ancho, altura+5, ancho+60, altura+5);
  text(sum6[1], ancho, altura+18);
  textSize(20);
}
