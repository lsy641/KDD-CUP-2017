
fidin=fopen('Ato2_Y.txt','r'); % ��ԭʼ�����ļ���aaa.txt��
fidout=fopen('Ato2_Y1.txt','w'); % �������������ļ�������˵�����֣�
while ~feof(fidin) % �ж��Ƿ�Ϊ�ļ�ĩβ
tline=fgetl(fidin); % ���ļ�����һ���ı��������س�����
if isempty(tline) | tline==' ' % �ж��Ƿ����
continue
else
[m,n]=size(tline);
flag=1;
if flag==1 % ����������У��Ѵ�������д���ļ�
fprintf(fidout,'%sn',tline);
flag = 0;
else
continue
end
end
end
fclose(fidin);
fclose(fidout);
