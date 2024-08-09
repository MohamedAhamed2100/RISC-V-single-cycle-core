# 32-bit RISC-V Single Cycle Core Using Verilog
  ## implemented Architeture 
  
![phpdEw2W1](https://github.com/user-attachments/assets/55cd774c-676e-4f7c-af00-d3840ec959f6)

  ## RISC V Instruction 
  
![image](https://github.com/user-attachments/assets/482566cd-9f13-42f6-8cb7-3b034eb9e0d4)
![image](https://github.com/user-attachments/assets/e0fe30a9-7a39-4074-bb58-087801248c69)

  ## Control Unit 
  
  ![Capture1](https://github.com/user-attachments/assets/c5fc4bf4-a218-4625-b178-e9d0be3e5bc6)

  ## ALU Decoder 

  ![Capture2](https://github.com/user-attachments/assets/fd37f84d-b6e7-4377-b2ac-c05e9975be73)


# simulation result in modelsim 

![Capture](https://github.com/user-attachments/assets/ffe7bcc5-428a-45e6-9bc8-3946fe2c96a1)

# RISC-V assembly instructuion used for test 
       
        if successful , it should write the value 71 to address 48
        Assembly                 description                                             address Machine Code (in hexadecimal and increase by four)        
main:   addi x2,x0,5             # initialize x2=5 because x0 by default value=0         0
        addi x3,x0,12            # initialize x3=12                                      4
        addi x7,x3,-9            # initialize x7=12-9=3                                  8
        or   x4,x7,x2            # x4=(3 or 5)=7                                         c
        and  x5,x3,x4            # x5=(12 and 7)=4                                       10
        add  x5,x5,x4            # x5=4 + 7 =11                                          14
        beq  x5,x7,end           # cannot branching as 11 != 3                           18
        slt  x4,x3,x4            # x4= (12<7) =0                                         1c
        beq  x4,x0,around        # branch to around as x4=x0                             20
        addi x5,x0,0             # shouldn't happen                                      24
around: slt  x4,x7,x2            # x4=(3<5)=1                                            28
        add  x7,x4,x5            # x7 =1+11=12                                           2c
        sub  x7,x7,x2            # x7=12-5=7                                             30
        sw   x7,28(x3)           # mem[28+12]=7                                          34
        lw   x2,40(x0)           # x2 = mem[40+0] =7                                     38   
        jal  x3,end              # jump to end and save re_add 40 in x3                  3c
        addi x2,x0,1             # shouldn't happen                                      40
end     add  x2,x2,x3            # x2=7+64=71                                            44
        sw   x2,44(x0)           # write mem[71+0]=71                                    48
