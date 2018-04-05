Electric Piano based on NEXYS4<br>
Environment: ISE14.7 NEXYS4/NEXYS4 DDR <br>
Note: Present version supports Nexys4. If you want to use NEXYS4 DDR, you need to modify ucf profile to make it adapt to the switches on NEXYS4 DDR<br>
Functions:<br>
1. Play the electric piano with keyboard in three octaves<br>
2. Change tune like CDEFGAB<br>
3. Record what you play and replay<br>
4. Play inside songs in different speed<br>
5. Display the musical note you play on screen<br>

Extension: Simulate different timbre. For we made use of PWM in this project instead of simple'0'&'1'digital output, it's hopeful that timbre of the electirc piano can be changed. But we haven't figured out this problem. <br>
<br><br>电子琴 基于NEXYS4 ISE 14.7<br>
Nexys4和Nexys4 DDR兼容，目前上传版本为Nexys4版本，DDR版本只需修改对应switch的引脚<br>
实现功能：<br>1.三个八度内键盘演奏<br> 2.支持音调变换<br>
         3.录音播放<br>
         4.以不同速率播放内置歌曲<br>5.基于VGA在屏幕上显示音符<br>
设计内可扩展功能：模拟各乐器音色，因为本项目采用PWM波经滤波器输出，而非单纯0，1变换，不同音色由不同谐波叠加形成，本项目的设计理论上可以实现音色变换，但目前并没有太大进展，欢迎交流
