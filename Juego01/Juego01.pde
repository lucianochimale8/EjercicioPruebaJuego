PImage fondo;
PImage personaje;
PImage enemigo;
float personajeX, personajeY; // Posición del personaje
float enemigoX, enemigoY; // Posición del enemigo
float velocidadX = 3; // Velocidad del enemigo en el eje X
boolean moverDerecha = true; // Dirección del enemigo

void setup() {
  size(800, 600);
  fondo = loadImage("fondo.png"); // Carga la imagen de fondo
  personaje = loadImage("personaje.png"); // Carga la imagen del personaje
  enemigo = loadImage("enemigo.png"); // Carga la imagen del enemigo
  personajeX = width / 2;
  personajeY = height - personaje.height - 20; // Ajusta la posición del personaje
  enemigoX = 0;
  enemigoY = random(50, height - 200); // Ajusta la posición inicial del enemigo
}

void draw() {
  // Dibuja el fondo
  image(fondo, 0, 0, width, height);
  
  // Aplica tintes al fondo
  tint(255, 200); // Tinte blanco semi-transparente
  image(fondo, 0, 0, width, height);
  noTint(); // Restaura el tinte a su estado normal
  
  // Dibuja el personaje en la posición actual
  image(personaje, personajeX, personajeY);
  
  // Dibuja el enemigo en la posición actual
  image(enemigo, enemigoX, enemigoY);
  
  // Mueve al enemigo
  moverEnemigo();
  
  // Checa colisiones del enemigo con el lienzo
  chequearColision();
}

void moverEnemigo() {
  // Mueve al enemigo de izquierda a derecha
  if (moverDerecha) {
    enemigoX += velocidadX;
  } else {
    enemigoX -= velocidadX;
  }
  
  // Si el enemigo alcanza los bordes del lienzo, cambia de dirección
  if (enemigoX >= width - enemigo.width || enemigoX <= 0) {
    moverDerecha = !moverDerecha;
  }
}

void chequearColision() {
  // Si el personaje y el enemigo se superponen, se reinicia la posición del enemigo
  if (dist(personajeX + personaje.width / 2, personajeY + personaje.height / 2, enemigoX + enemigo.width / 2, enemigoY + enemigo.height / 2) < personaje.width / 2 + enemigo.width / 2) {
    enemigoX = 0;
    enemigoY = random(50, height - 200);
  }
}

void keyPressed() {
  // Mueve el personaje con las teclas de flecha
  if (keyCode == LEFT) {
    personajeX -= 10;
  } else if (keyCode == RIGHT) {
    personajeX += 10;
  }
}
