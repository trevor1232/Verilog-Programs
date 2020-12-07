char mystr[2]; //Initialized variable to store recieved data

void setup() {
  // Begin the Serial at 9600 Baud
  Serial.begin(9600);
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(13, OUTPUT);
  pinMode(12, OUTPUT);
}

void loop() {
  Serial.readBytes(mystr,1); //Read the serial data and store in var
  Serial.println(mystr[0]); //Print data on Serial Monitor
 char test ='a';
  if(mystr[0]==test){
    Serial.println("You're a hacker");

    digitalWrite(12, LOW); // sets the digital pin 13 on
    digitalWrite(13, LOW); // sets the digital pin 13 on     
  } else {
    Serial.println("You failed");
    digitalWrite(13, HIGH); // sets the digital pin 13 on
    digitalWrite(12, HIGH); // sets the digital pin 13 on
  }
}
