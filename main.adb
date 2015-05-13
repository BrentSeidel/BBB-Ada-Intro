with Ada.Text_IO;
--
--  This is a simple program for trying out various things on the BeagleBone
--  Black.  It should be considered to be experimental code and is probably
--  not the best practices.  However it might be useful as an example of how
--  to do some things.
--
procedure main is
   --
   -- File names for the four user LEDs.  If there are are problems accessing
   -- them, ensure that you have permissions to them.  May need to chmod the
   -- files.
   --
   led_usr0_name : constant string := "/sys/class/leds/beaglebone:green:usr0/brightness";
   led_usr1_name : constant string := "/sys/class/leds/beaglebone:green:usr1/brightness";
   led_usr2_name : constant string := "/sys/class/leds/beaglebone:green:usr2/brightness";
   led_usr3_name : constant string := "/sys/class/leds/beaglebone:green:usr3/brightness";
   --
   -- The actual files
   --
   usr0 : Ada.Text_IO.File_Type;
   usr1 : Ada.Text_IO.File_Type;
   usr2 : Ada.Text_IO.File_Type;
   usr3 : Ada.Text_IO.File_Type;
   --
   -- Procedure to turn an LED on
   --
   procedure LED_on(f : in Ada.Text_IO.File_Type) is
   begin
      Ada.Text_IO.Put(f, "1");
      Ada.Text_IO.Flush(f);
   end;
   --
   -- Procedure to turn an LED off
   --
   procedure LED_off(f : in Ada.Text_IO.File_Type) is
   begin
      Ada.Text_IO.Put(f, "0");
      Ada.Text_IO.Flush(f);
   end;

begin
   --
   -- Open the files
   --
   Ada.Text_IO.Open(usr0, Ada.Text_IO.Out_File, led_usr0_name);
   Ada.Text_IO.Open(usr1, Ada.Text_IO.Out_File, led_usr1_name);
   Ada.Text_IO.Open(usr2, Ada.Text_IO.Out_File, led_usr2_name);
   Ada.Text_IO.Open(usr3, Ada.Text_IO.Out_File, led_usr3_name);
   ada.text_io.put_line("Hello world!");
   --
   -- Blink the lights
   --
   for x in integer range 1 ..20 loop
      Ada.Text_IO.Put_Line("Lights on " & Integer'Image(x));
      LED_on(usr0);
      LED_on(usr1);
      LED_on(usr2);
      LED_on(usr3);
      delay 0.5;
      Ada.Text_IO.Put_Line("Lights off");
      LED_off(usr0);
      LED_off(usr1);
      LED_off(usr2);
      LED_off(usr3);
      delay 0.5;
  end loop;
  Ada.Text_IO.Put_Line("Done blinking...");
   --
   -- Close the files.  Somewhere around here Ada throws an exception.  Need
   -- more work to figure out why.
   --
  Ada.Text_IO.Close(usr0);
  Ada.Text_IO.Put_Line("Closed usr0");
  Ada.Text_IO.Close(usr1);
  Ada.Text_IO.Put_Line("Closed usr1");
  Ada.Text_IO.Close(usr2);
  Ada.Text_IO.Put_Line("Closed usr2");
  Ada.Text_IO.Close(usr3);
  Ada.Text_IO.Put_Line("Closed usr3");
  Ada.Text_IO.Put_Line("All done now...");
end main;
