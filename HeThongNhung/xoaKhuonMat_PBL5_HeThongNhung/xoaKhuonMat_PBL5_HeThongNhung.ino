#include "esp_camera.h"
#include "fd_forward.h"
#include "fr_forward.h"
#include "fr_flash.h"

#define ENROLL_CONFIRM_TIMES 5
#define FACE_ID_SAVE_NUMBER 7

static face_id_list id_list = {0};

void setup() {
  Serial.begin(115200);
  face_id_init(&id_list, FACE_ID_SAVE_NUMBER, ENROLL_CONFIRM_TIMES);
  read_face_id_from_flash(&id_list);// Read current face data from on-board flash
  Serial.println("Faces Read"); 
  while ( delete_face_id_in_flash(&id_list) > -1 ){
        Serial.println("Deleting Face");
  }
        Serial.println("All Deleted");  
}

void loop() {
}