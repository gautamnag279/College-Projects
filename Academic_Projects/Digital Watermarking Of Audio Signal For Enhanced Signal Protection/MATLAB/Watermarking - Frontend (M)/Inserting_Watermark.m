clc
clear
close all 
[host, f] = audioread ('Original_Audio.mp3');   
host      = uint8(255*(host + 0.5));  
wm        = imread('Seal.png');  
[r, c]    = size(wm);                 
wm_l      = length(wm(:))*8;  

if length(host) < (length(wm(:))*8)
    disp('your image pixel is not enough')
else
    
host_bin  = dec2bin(host, 8);          
wm_bin    = dec2bin(wm(:), 8);        
wm_str    = zeros(wm_l, 1);       

for j = 1:8                         
for i = 1:length(wm(:))
ind   = (j-1)*length(wm(:)) + i;
wm_str(ind, 1) = str2double(wm_bin(i, j));
end
end

for i     = 1:wm_l                   
host_bin(i, 8) = dec2bin(wm_str(i));
end 

host_new  = bin2dec(host_bin);       
host_new  = (double(host_new)/255 - 0.5); 
audiowrite('Watermarked_Audio.wav', host_new, f)  
end