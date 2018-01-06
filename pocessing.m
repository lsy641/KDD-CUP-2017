
fidin=fopen('Ato2_Y.txt','r'); % 打开原始数据文件（aaa.txt）
fidout=fopen('Ato2_Y1.txt','w'); % 创建保存数据文件（不含说明文字）
while ~feof(fidin) % 判断是否为文件末尾
tline=fgetl(fidin); % 从文件读入一行文本（不含回车键）
if isempty(tline) | tline==' ' % 判断是否空行
continue
else
[m,n]=size(tline);
flag=1;
if flag==1 % 如果是数字行，把此行数据写入文件
fprintf(fidout,'%sn',tline);
flag = 0;
else
continue
end
end
end
fclose(fidin);
fclose(fidout);
