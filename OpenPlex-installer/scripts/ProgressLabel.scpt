FasdUAS 1.101.10   ��   ��    l   b ����  O    b    k   a     	  l   ��������  ��  ��   	  
  
 r        n        4   	 �� 
�� 
cpar  m   
 ������  l   	 ����  I   	�� ��
�� .sysoexecTEXT���     TEXT  m       �   V c a t   ~ / L i b r a r y / A p p l i c a t i o n \   S u p p o r t / s t a t u s O P��  ��  ��    o      ���� 0 lastline lastLine      Q    #     r        n        4    �� 
�� 
cwor  m    ����   o    ���� 0 lastline lastLine  o      ���� 0 one    R      ������
�� .ascrerr ****      � ****��  ��    r     #     m     ! ! ! � " "     o      ���� 0 one     # $ # Q   $ 8 % & ' % r   ' - ( ) ( n   ' + * + * 4   ( +�� ,
�� 
cwor , m   ) *����  + o   ' (���� 0 lastline lastLine ) o      ���� 0 two   & R      ������
�� .ascrerr ****      � ****��  ��   ' r   5 8 - . - m   5 6 / / � 0 0   . o      ���� 0 two   $  1 2 1 Q   9 M 3 4 5 3 r   < B 6 7 6 n   < @ 8 9 8 4   = @�� :
�� 
cwor : m   > ?����  9 o   < =���� 0 lastline lastLine 7 o      ���� 0 
percentage   4 R      ������
�� .ascrerr ****      � ****��  ��   5 r   J M ; < ; m   J K = = � > >   < o      ���� 0 
percentage   2  ? @ ? Q   N d A B C A r   Q W D E D n   Q U F G F 4   R U�� H
�� 
cwor H m   S T����  G o   Q R���� 0 lastline lastLine E o      ����  0 curtransferred curTransferred B R      ������
�� .ascrerr ****      � ****��  ��   C r   _ d I J I m   _ b K K � L L   J o      ����  0 curtransferred curTransferred @  M N M Q   e � O P Q O r   h r R S R n   h n T U T 4   i n�� V
�� 
cwor V m   j m����  U o   h i���� 0 lastline lastLine S o      ���� 0 filesize fileSize P R      ������
�� .ascrerr ****      � ****��  ��   Q r   z � W X W m   z } Y Y � Z Z   X o      ���� 0 filesize fileSize N  [ \ [ Q   � � ] ^ _ ] r   � � ` a ` n   � � b c b 4   � ��� d
�� 
cwor d m   � ����� 	 c o   � ����� 0 lastline lastLine a o      ���� 	0 speed   ^ R      ������
�� .ascrerr ****      � ****��  ��   _ r   � � e f e m   � � g g � h h   f o      ���� 	0 speed   \  i j i Q   � � k l m k r   � � n o n n   � � p q p 4   � ��� r
�� 
cwor r m   � ����� 
 q o   � ����� 0 lastline lastLine o o      ���� 0 mb   l R      ������
�� .ascrerr ****      � ****��  ��   m r   � � s t s m   � � u u � v v   t o      ���� 0 mb   j  w x w l  � ��� y z��   y  	tell me    z � { {  	 t e l l   m e x  | } | l  � ��� ~ ��   ~ + %		display dialog "Cloning OpenPlex...     � � � J 	 	 d i s p l a y   d i a l o g   " C l o n i n g   O p e n P l e x . . . }  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �                        " & one & " " & two & " " & curTransferred & " / " & fileSize & " (" & curProgress & "%)" & " " & speed & " " & mb & "/s" buttons {"Please Wait", "cancel"} default button "Please Wait" giving up after 2.5 with title "OpenPlex Status"    � � � �                                                 "   &   o n e   &   "   "   &   t w o   &   "   "   &   c u r T r a n s f e r r e d   &   "   /   "   &   f i l e S i z e   &   "   ( "   &   c u r P r o g r e s s   &   " % ) "   &   "   "   &   s p e e d   &   "   "   &   m b   &   " / s "   b u t t o n s   { " P l e a s e   W a i t " ,   " c a n c e l " }   d e f a u l t   b u t t o n   " P l e a s e   W a i t "   g i v i n g   u p   a f t e r   2 . 5   w i t h   t i t l e   " O p e n P l e x   S t a t u s " �  � � � l  � ��� � ���   � C =	if the button returned of the result is "cancel" then return    � � � � z 	 i f   t h e   b u t t o n   r e t u r n e d   o f   t h e   r e s u l t   i s   " c a n c e l "   t h e n   r e t u r n �  � � � l  � ��� � ���   �  		end tell    � � � �  	 e n d   t e l l �  ��� � Q   �a � ��� � k   �X � �  � � � Z   � � � ����� � =  � � � � � o   � ����� 0 one   � m   � � � � � � �  R e c e i v i n g � L   � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ����� 0 
percentage   � m   � � � � � � � D %   C o m p l e t e   C l o n i n g   O p e n P l e x   ( 1 / 2 ) : � m   � � � � � � �  
 � o   � ����� 0 one   � m   � � � � � � �    � o   � ����� 0 two   � m   � � � � � � �  :   � o   � �����  0 curtransferred curTransferred � m   � � � � � � �  / � o   � ����� 0 filesize fileSize � m   � � � � � � �      a t     � o   � ����� 	0 speed   � m   � � � � � � �    � o   � ����� 0 mb   � m   � � � � � � �  / s��  ��   �  � � � l   ��������  ��  ��   �  � � � Z   , � ����� � =   � � � o   ���� 0 one   � m   � � � � �  R e s o l v i n g � L  ( � � b  ' � � � b  # � � � b   � � � b   � � � b   � � � b   � � � b   � � � b   � � � b   � � � o  	���� 0 
percentage   � m  	 � � � � � D %   C o m p l e t e   C l o n i n g   O p e n P l e x   ( 2 / 2 ) : � m   � � � � �  
 � o  ���� 0 one   � m   � � � � �    � o  ���� 0 two   � m   � � � � �  :   � o  ����  0 curtransferred curTransferred � m  " � � � � �  / � o  #&���� 0 filesize fileSize��  ��   �  � � � l --��������  ��  ��   �  � � � Z  -= � ����� � = -2 � � � o  -.���� 0 one   � m  .1 � � � � �  C h e c k i n g � L  59 � � m  58 � � � � � 2 C l o n i n g   O p e n P l e x   C o m p l e t e��  ��   �  �  � l >>��������  ��  ��    �� Z  >X���� G  >M = >C o  >?���� 0 one   m  ?B �		  r e m o t e : m  FI

 �  C l o n i n g L  PT m  PS �  ��  ��  ��   � R      ������
�� .ascrerr ****      � ****��  ��  ��  ��    m     �                                                                                  MACS  alis    `  10.10                      ���H+     A
Finder.app                                                      X&���l        ����  	                CoreServices    �1B      ��$�       A   5   4  /10.10:System: Library: CoreServices: Finder.app    
 F i n d e r . a p p    1 0 . 1 0  &System/Library/CoreServices/Finder.app  / ��  ��  ��       ����   ��
�� .aevtoappnull  �   � **** ��������
�� .aevtoappnull  �   � **** k    b  ����  ��  ��     / ������������~ !�} /�| =�{�z K�y�x Y�w�v g�u�t u � � � � � � � � � � � � � � � � �
�s
�� .sysoexecTEXT���     TEXT
�� 
cpar�� 0 lastline lastLine
�� 
cwor�� 0 one  �  �~  �} 0 two  �| 0 
percentage  �{ �z  0 curtransferred curTransferred�y �x 0 filesize fileSize�w 	�v 	0 speed  �u 
�t 0 mb  
�s 
bool��c�_�j �i/E�O ��k/E�W 
X  �E�O ��l/E�W 
X  �E�O ��m/E�W 
X  �E�O ���/E�W X  a E�O ��a /E` W X  a E` O ��a /E` W X  a E` O ��a /E` W X  a E` O ��a   9�a %a %�%a %�%a %�%a %_ %a  %_ %a !%_ %a "%Y hO�a #  %�a $%a %%�%a &%�%a '%�%a (%_ %Y hO�a )  	a *Y hO�a + 
 	a ,a -& 	a .Y hW X  hU ascr  ��ޭ