PGDMP  *        
    
        }            bank    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    bank    DATABASE     x   CREATE DATABASE bank WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE bank;
                     postgres    false            �            1259    16408    balance    TABLE     �   CREATE TABLE public.balance (
    client_id bigint,
    client_name character varying(30),
    amount double precision,
    id bigint NOT NULL
);
    DROP TABLE public.balance;
       public         heap r       postgres    false            �            1259    24734    balance_id_seq    SEQUENCE     �   ALTER TABLE public.balance ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.balance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    218            �            1259    16389    client    TABLE       CREATE TABLE public.client (
    id bigint NOT NULL,
    full_name character varying(255),
    pasport character varying(15),
    account character varying(255),
    phone_number character varying(20),
    email character varying(80),
    name character varying(255)
);
    DROP TABLE public.client;
       public         heap r       postgres    false            �            1259    24758    transaction    TABLE     �   CREATE TABLE public.transaction (
    id bigint NOT NULL,
    client_id bigint,
    client_acc character varying(20),
    amount double precision,
    datetime timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.transaction;
       public         heap r       postgres    false            �            1259    24757    transaction_id_seq    SEQUENCE     {   CREATE SEQUENCE public.transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.transaction_id_seq;
       public               postgres    false    221            �           0    0    transaction_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;
          public               postgres    false    220            *           2604    24761    transaction id    DEFAULT     p   ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);
 =   ALTER TABLE public.transaction ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    221    221            �          0    16408    balance 
   TABLE DATA           E   COPY public.balance (client_id, client_name, amount, id) FROM stdin;
    public               postgres    false    218   v       �          0    16389    client 
   TABLE DATA           \   COPY public.client (id, full_name, pasport, account, phone_number, email, name) FROM stdin;
    public               postgres    false    217   >1       �          0    24758    transaction 
   TABLE DATA           R   COPY public.transaction (id, client_id, client_acc, amount, datetime) FROM stdin;
    public               postgres    false    221   O�       �           0    0    balance_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.balance_id_seq', 500, true);
          public               postgres    false    219            �           0    0    transaction_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.transaction_id_seq', 6, true);
          public               postgres    false    220            -           2606    16469    client client_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public                 postgres    false    217            /           2606    24764    transaction transaction_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_pkey;
       public                 postgres    false    221            0           2606    16496    balance balance_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.balance
    ADD CONSTRAINT balance_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id);
 H   ALTER TABLE ONLY public.balance DROP CONSTRAINT balance_client_id_fkey;
       public               postgres    false    217    218    4653            1           2606    24765 &   transaction transaction_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT transaction_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id);
 P   ALTER TABLE ONLY public.transaction DROP CONSTRAINT transaction_client_id_fkey;
       public               postgres    false    217    221    4653            �      x�U��v�8�@��Wp׫�c����L�ݙ���a	%��I+�_�n ��{��HD ���Y�v�ɾ����<'yZ��d�U�ݴ�,i9I���6ٽr�lT+�eZN��a�Oٕ]�d�J�Yr�Un�L��G�v�=�Zd����ԭ�nU�5�?c����uFgO����:K���ծ��i�z��`�Vy�4ζ�w���.ҪH��Q-o|1�J��W�"���Q�V�<����yZU�v~�M\.�j�<(wjL����o���2��ɒ��<�p0��/Wi��A��]＆�$���㩭1�M۪&Xt�V��v�����v~}�N.��F��v��~u�Nr�gM��������������<�������H'ere[Q����/����c�_ڵݴʯ�d���k�U����)�t2M��nNl��ïU�d�ܙ���W�s�V�$�̓g����m���t���ݩ����!\�o�b�N�Ӭ��o����t�'׊?,�Zǽ,�i���_��|�"����h��6����3�<�V8L���f�ݶ�'�^��Ir�h�)�l9����t����@.�zk�.<�J��;��Cqٿ��_���9n��eo���]��t��Z���vp��K9Kgɋ��Qklɹ���<��ɗvñdo�4�n�"��#�T�VN7{ԛ`��"��ɻ�5�/��y:��{��*��S��WE:�$OFGgߵk��2�M��˱�.�^U��YroW��x2��_���yr�ܚ7�^��i:[$<϶�4׶��A�j��/db�S�}��9q���H0-�f��H�詰����JN.�y�<Y\뺍i�'y:��/�2j������I��'�w�-T&��ǟ��|��G��ٚ^X�ǤJ糄��O���j�:�g����Ɋ��5��▦霣m�P��ܫ֩��ZLf��"���uًr�蜓y����'������>F�d�.��r���M��E�(�Kg����v����N�tA��gۓ�1��H��M9�❶����xZ��)��[���5��w>L�t1Knys���:8�t�.$ǳA�ץ[oW㛧還���������Y�_\$���/Ml:g=�6���L|ʂ�B��C��f��V���+� :��Y��J޶$s��Z+G����[I��P)J��xo�W���
�cɉ���n�.A2A2'���l�g6E�H$�I��DR���~~�gm6'��z��y�����+�=�
��"y���X�樞s��7����d1G�"��P!���m>��u�imv��l7G�|�ܜ��ɧ�&�Q9��*	�����WQ7�K��1�k�*�}s9�Vj��9����F56{5���?h\伣��wM��{B�@�ݱ��ᷯ7�.P���㸊�v:;�݋*y�	���ci��Tc�7�V0��A��ŔT9���MNb���,���
�6D��p/� ���K�?��/пX$���Y2�v�6/0Ay�cwT�?7L�/�kz�h�Fnu�L4��2�;_���.f1"YInh;��+lXG��J��%m���A�'��ٵ�� �sIxf�z�D�d7�z��V���9�����{��\�6�u�?�tЁ�:�]o����GuNÄ�%d����f�-��`��Ԇ�;�m&��a����ao��r �j
�nQ��`�c`��a�o7��	����y�5�h/h,Ǯ�/�)7��4�Ⱦ���j���` ���%�쉯� � ���o��@.d�A`��y5�G�u��=`���H	Q�@Ѩ>d��f?���S�Lt24�Tn��a��Y�=�c�l7� �r�̣7�%!t��` Z�=H�U����V��G�Ԯu�3i�-������4%#j	�� ��id�`\ -����Wӭ��G�j�MOdߞ��ZH �s�H����b�S�qG��2I� �H�����m���ڭ�}��9Q�W�[G)6 ��ɝ��?�b
y�
v˅Ҷ��^Ȗ�2V ��h^͡;o�h��y�	(��Ci��)ك��c���`ګ�U����pBP�;qLN�(PDb&p
B`o����gB1�������0� �-��R|�0����`�a��\>�<��b<b#h
����%F� �h �.tƆ��+Pr{���;�9:H�o�z
g��PB"��|JMxw�BK*ᄰ��jG���r��I#�v��(@y�N�9+]���jA(!��N����ľա8�ikviӝ������&4�6밎����Rd�P�.����Аt�@y9,�x����`  /��L�	�0�~ ��)��޵^�Cx�B*�_�9�q��p�$�Fj�=���rH��c£��zL�0^�����p�VK�ц<��`���4��d)�񡆠.�W�vW'R:[���E8�
���HY�S�?s$ErS��y��_�ZJ�HJ]�+��%�#AO�@{Dɺ���������
�8?���o�i�HmȄuz��! ���2<C�&P_��~��x"�iب/�ۍo�0ރq+8L�:Vد���{����B� # y�[��(r�,诀��$�{�D�=�W�ҥ���o�ihCE�! �:�71�?l���ޫ�z����#�,r�ZX�v�ہ�ܻ��P_?l�0��nٕ��jV���]��� ��L�޻j�q#�h�ɝ4�Ҷ�1�`����-}{7�X�y�=q?�Ǳ�����5�p��O��h�(d�I�5��T��ػ#���#j��U��?H`���?a h�^�*�B�@���w����v�� ��N�i�Ra� �!�W�թ����h�� �[��^:���cH|3[�oɟadF�!�$7���X��@�!��9Bߴ:���_�lVj�o�r��3d�3,d�fs<�0�GY�]v�Z��@XT��'5jh�4,���V�ͳ�$�X.d�ԑ�)2���qk�_	�o�`�P&ې��.d��d�!{��������UCd ��Vo АΤ�"�z��s�yK�ƕ���zC&������ٓ2���:������ǉ(=b�oA��w/Lg���f0���Z��YL�}%ϒ,�j���@b_����F�!��J�	Z{��O*�f`��[���7X5z�XLdiwٓ�����XL�"Nzx���\"͓�ƞjv@�K̅3����Yiə�� ����K��8 �<�N�MXG��?x {�G50 ��@Oٝ� ��)ч�vG��x�
�= j,���C+��C�&L�Jv����BR%�a C�Y��R@cR>8�{ݺS�E���9x�؏��
2��1�=��Z�Ga��Qw2溦46�X���t8�Y�!`������&�#@���.�u�=�&m��($o����;�b~�Bz����!�b,��K�/i�m� �7����E���/�{�:��!��=��Rw�H;�\,��;�Ks��.��7�sLi�b�n;�1ξ��L "��VRp�ݏe�HD0I�Q��A�q�@("�뗩��>�1��f����[�� �D Ht�~U���� �b�y�<��'�z�!��L,�����`��a(|k��fT��Ⱦ���{��CV����ܰ�o�`�Qy��j���4}�VH��	J\�E���C��� �	��7�:LN��ùC���O���ك�{v� �O�r��u�6,!�'UK�>̘�@�R|;�D�ڷ>A6GF
�>�~�B+ed2�rk:�#z�X^H���R�iE��fKaA[KXP���^��� ߵp�>J��H,/����B�?h�%Q�t��������T�L,s��p4L"��qPb)4����Y~7�E��5���}�Ar��q'�
�3;�X���x�:�Q�D� ta��#̝	?V�R�>�uiFׅK`�ڳ��Z. T��"D�$<,�s� �9�S�H����t�҂��۶ZG	��$��%1�z��� ��OM�X�	�M�Wu{�ڠ}!� ���p�:�X��q@L� v�Pv��&�i�u�-�k� �X3��l�ۿ���c�b)P�%A, *�  �
  ᝓfJ��Z��7a� �?4z殺�� �ju��#_���BY�b)�c��!Y/�oNB�~��� B9�����ڧmb�e���Dmv�T���٩ �J�!����fɷ�3y����%Y_��<#������4�� ��~kz�n����ɛ�I�*S�.1��𔆎xn��$ �[�m�q����Ő(DZɍC�u�U3��2)��d4:^#}d�j�m:g$b�L����8q��`���+u�Bm$�,��8-��A�%�wƴ+7��:�w�o�$�n��W�h.�����t[��݅3�K���~O����W��$�.��z����ˮ����n�# ©L�$c��x����2�S�$Q£Q� ����4bLxO���w+�0�U� �}��ɹt]3�; ~_��<�^&|۠,PX�����.>;@�'�o�o3>#�~�dK�����`���K%����_�Q�P�Ո�� b꟟���iQ]8@���J���p���8�$8i)�,,h��Y~H���A*_/���l|.,���Ҏ�+D���Y	H��LLU$�ҏ\䲗�����r&c ?��f���XE2�K�I�7�	t/�K�/8�ۭm{5�
dX�r[G���8� R��_+�Q�'�`B谄i��B1�M�K���N��o��+��#��_�R�6.�3�	n18�/�� �KP�JhSF��C �WC,ݦ���p��^���T�1�X�����N��Db��X:��A#�`.�y_I���ƻ{��o�$M������iHp%��JN(�$�� ���o�b}@��ٵ!T�� ��k<��3UG���� ~��m���ma�d©d ��u@b�)Qx��c�˅�~I��
(<D,e*�m�G���.���B�a']�� QUZ	�~ewZ�v+���i����?�auQ��&�;iU�i��N���%u=��X�%#���;��b'|?�!V���C)���.�>�X��^R�'�a��aҵn &�|����V ���i�����Ź6���<� +�~�v��_�17���w�y��)�
+�}�����f/�	��ޓ�C^�'AA$1���B�Y�2��2u�K&ڶXǡ�*��{]�_�u���A�J��$g�Ƒ�ce�+��n��l4�o Y^����\��(��5�wm�����v�!�"��m��I�~?^��Hx�)��$���\P_F��2q�֫�"�/B����n��c���OA�^>��$������=ʳ>��F�` �o�o-V0߭�ס�>WX�����[�����@��򝋽g) �k��K�-���f��y|�<�ȘS�0����#�.�'3
�
_�l���Y�\z�c��ztb+�K��42(�aM�vH^����b�Tr,ߞtR���Y�id%�2���-�^�x寀�k�2�!ɽ�B�/�%�����n|�\�&ϖ����s�*��%)7���+vS�!�����.�d�~��Hn�G:�
2��*���S:���K2������M�ʫd��'�'�[扫xSX�H����� $m;~�S�T�_OP&��'�;�$��2ѫ�i�븳T�v�}T~�G�R䃖��y_%�i������y�,�?���W�]tA&��Yl�����@� �ޞ��7@��&,J+�ܒ|jOK��p��p���6��R���9��B:~|�&r�hߏӐJH��,��&~�G@	����������qO|2�Ũ��9z�)D�|�?3��xޥ|�Y��m'ms`m^��d�Al����R�����,¾���F��6~�h�.�"�G2�m����U�?7����֩p�`[E�so]�K���w�g\�K��� [%o�?P�[�h��{n��n&|���Y�h;�5���V�����-M�|�y����H���2p~�ǔ����+T���KDހ`�,���|����o�Н��-|H!�$��<���y-��:�����~�&�W�^��W���/����xxPZE��n�Q�@��0ZE�C_(�,�����|x;�J��͞N"߆~�7 �ů��A%�gy.c�$POݝ�Ҽ���ʧH��|D�d�WM�{�͸k�}��;����tHw�J�orebJ��~R2�Q������(^� �� �Ӫi�wGC�l�S��/)����b=�m��x"৙�1�	��%��� ��3�:�O{��t���m`�PC��h�n��v/��˕@�ѿ}���	�"�6�b-(c���10��.WrG�y�����6�� �F�:^Q豜�I{��*^�d<@A��� q�X	��������3�J���(|Kh�N��xb
��k�cv�?`S	��ž�O������<��z��4�~�9P�紶�qc.�A��f3~�^	�I_�::�E%�6��{�Mp��QX%�6��7 ���U��.Bos�&0@��;�l� �\����l7~pS	��=�O��-���2)�d�4���(.}�����W	��]	�ɍ�Dw�9M�[�}c���=���B\@���ֆ�M%�Fct�}�������v�5��E}�.��r?h�A��C\	���4��O���2t������q�%-��}�C>O�/�U��j�t"�D��_>?�V�eb�03�_�Ե%��?'!!	aHo��Hy`*Wk����"hSɵ��.9�#��\2��������_���      �      x�|�ٲ�X����W�"Cn���2�Jۙn;;+�⾐%�I�I��_�)�x�]]C� �= ����j8n��U��V٧��V�Y�\�p��އBa�/t��?�����?|��̬-6:�vK> /���Y��U'������������}�oN��c�Yn�w�26���
�}��h��8o��9��F=�DX����n�>ݨ_��v�}���J��,�h�S!��]rE��1����/�Dg����xlR큢Ey����v)�l�$��O�M;(mB����`U,���a%R�9��B��B��#<8��.��rL¦<�ճu��';�7�3tU����W��6����A�`l�ƺdc���Ac���pX����>O�Y[������Zx����ɿ.����>�gE��:��8_`yr�W�B���������P,��^m�Iؕݮ�/���P����tö=�cm�E}T�)�x$NJ�x���1�p�uR��q�����gw>=�O��q߶��~�!j�n�(��g��{��+�<�����E���Y:�v�TC{]��p�;|�Ǿ�8�:aβ�
�?�*�d��qHl�q�u��8?j9�},���l�5{>S��c{���~w���*.Ϝq8vʘ�6X�p?��#v��&&�wX`����t*�C]_>Xk�������6�Q�`bfC�Ӭr����<7�t,1.)��N/l��.��4�t��^�x�_^��6��}���諾�'�,b
�f���`�w8���ƾ�3�]�h
ug�l�㭍zuZ��6�Ե�C�T4TE�R�됢	E��),.��*�4Ow�-
��Z��<n�]��v<���5V��s��X{���aCcnT��6B�$��¯�-��FF�ろ^�`�Z/EvY>v�]u]y���M�����	{eRʳ��̕����lL��Q�uX�.&��\��r�.�j���^=�p@����~Y5��d.������q��<�1�KJ|��e�E\�h���DxU�U�����MP��j�Uw���|�WxhQk��.�˓���]�x����%t��z^�������^�8fЎ�P�P�ON��؂�u
Q'|�O��v�0�k��&�4�IxSn������T'�|�f�;�:�IȰy��'%X˃��q��V����@d̂j^UkHv?;08R�}���j����8�9�}�K��VE�^������6am���`��&˦��Zd�J�����ˇZ}<���_C����FA�,`�qp��!���o�Q����z��3��p����նk�����k�v�	�睍ж�ǁ/��Q��	���8�ӭ�^N|���E�M�����r/pi���;����4��3�C�3iC�`O-�R�/�/��{��H���\��9N�r�ٷ���%V��%4��_�{�F(�d3����b���&6w�;pJq2�Y؄�Y����6zs��u��©��c��	�������""�����W�w`G=~	~����8&���<�g��χ�-���G�+�����*�hK��P؅��S1�/��^v��)uQ/�:?���w�����ޜ��fC3��t�<U'��* ��PJTk<F������j3L����ry{CTT�~����->aU}>�P=�e@y����O�
$�p���̸� �6�d���">����@I}��ޟ�Z4�����y��tPk�g���	fc_��r�WW�br��еˡk6ًvX�Bc�����.����px����ǅ��冇������\�j>�˪۞w�7|��ӽ�D��iy�>�����O9 �L���m�;��p�pP��@4vd����E�Tv��R�] ݴ �{����>V�`����X� %����Z��j�����c�c�/�2�I��ܞ��z��$_ﳿ�u�p3�G�5�aP 5<A`��7��*`�Оު���>�͡�aϪ�X�~���k�Ѱ�Sd �MH��h�����{ ܂�oE�K9��ׯv|t���P���Հ
rh}�U�]��I�a��0�`�[�/��Y�\����^�W�N�- T_����g��)��Ox4�F��չ��������D���ʺ�Z��~�N�Uݛ����!�w�~\�@�
F�d0�А��#G�
���V� E���,J�C���EZ�����U�'�2���e�8�����0�kE˅M���+a�
|;�U�hA� &C��_W����i�\L9��@	P��X2e�vY��H�	�������=���� 7,���Mº(���� '}��8��N�%ˈ��Pk=���N�� Z���ǅ�
,�� ��k�>_Ӕ�<��;<Ce�3�� �E�O�N���� ��~���eh���C�>뇵<�P����[����m�S�V� �T��^)Eq��2� M��-�,r�6uw���+�]���?[����AW{,��%��Q�D@{� �K�X8������'�s4Q��� ��|�_��Fy�wx�S�ų�g2hq���&U,1�OA�G��� j��p���Pn�w�m5���38�O��"�?�:U��������M����5�[��aѬW/p���w�C�_+* jXQX&" SMV8T6�S���ځ��ͩ��N妫O��p�:ܣ0ꭢ��
<��KK��
����ń:����1_y�����J��~ۯ�oܼwg9�_��j;�{�W `GEG��!��pz�u�6��$�7du]6հ�k�ms|b^'>B]�^eO���#u��. ǂ�������L����-�A�v��f�0��n��i�jy�����&V�ܰ,�����x=0t�g$E�|������F���EX/�~���a1�=|�g�� �_�=`l��7���X�,��puhğ-��4� �p{<�8�Wz���xNҺ-�����RϺ�w�ڞF��G,��������0�d��&CiF*Ĕ�70��+�q����wx �e�����?���)��Z��x�Z�G���s�q�#��«fI�.��E�8�=`�%�׾���
�Х�F)��U�� cH�
]''�Z�3<�B�(��ޔ�n�|�b��o�����նb\�Ry�|`aP�C�EXB}�,Xy��9�+7@�EN󹺟�uW6CխG|������m�g���
�O"hz��3V�H\[>�F�S�sa�a�H�n� ���8�͂z�׶8<ðv��"
ƇCc�@3�8�>YB�pN�nLP놢���ˀ���Vȸh�n���!:ú�+�����2o+N����S�D(��IXo�eOl@G�f]h�px�٫�Ű����"�.P�V��� ��I�g,���iZ����U^�ʪ�|���szа;�1�s���q� ��X)^a�X�plpD%�Eh��k��)����Gh��g�c��U�_ /�!�r�{а< �&pva��@ �	��Àk������<�/�x�$���(�7��.\��	�"�,K�
<��bW���8��R�rF�'a}(e��C���~=`2�C;d����a;�|	|,�N����+h}��e\-��v8,��,�?����ñ�������}�|�0V�6����X�kA��[A���{�q�qp��*��C9T�X)��S���嶭����i�'x�<��[�����g
>Ť�BQ��USST��a<]7�����v��O#P*4%d�s"nC �3vDkYp�rPB�-�5���Y\˱;��?]�e�	X�!��C�K|�U1���"�B��f�3�K��jQ�O�ԧr.��G`ڱ��/t�* o�O��G��H�&����I�S==7$�m�q� ��EV?����_�N>�oK��j��{�q2�4\�,�	�H�',d�+��-pB��2�5���r���,���C𡂧[5P�#=iŨc�� P&�o��^t���qF����]h�su&a��l���`���_CYg���B�    O1���1Cs'�?��������:F/�����>���?l��qe��;��꼧�����F��2�Y;�3~d���2
<���q6�X#�b�񨿖m{ @�|�QU��3����Q�X���e舸�b�p���^#a�Y��	��k�7X���.���/��-�atCl��hV���EAp�(��Å�����^d]-n�p50@��;zD{h�*`���I�O@sz>��3�O��Ӹ��0j� �EQV��S7��M7�� �x}�?6��2�% ����p(`���D��>�ٱ�'���rq�:�(Z��]^il�������wp-��y�	�S�Dt�����*:�����7;���u]�����/�&��<��e7�te2���Ȝ��5ʟ�`@�KL�'^3@���h��}�<:�S�z�{B�W��`� p*���N<��7�䙀��9����,L��XN/�������5�ZX�70y�-qn,�1�S��/,,>���T䳪7�	�Dm�)Z�������~.��#��ݺ>S�9�e ����6�	O�B�o\d��3ʈQ�ꚲE���⸾���h�Ok�T��VH'>@%c�b��R@��A�B$�fFc�3�j[O�E�4��:.���}��u< �K*��(�FU�A�zbR��K�-��F�D;�m�ǹڍ�±<Հ���V���d�p5���,3C7��8�� o���Fq�+��Ux��F�dQ���o�퀃B�MiOX�c��_�#,���+��%�viѾ�L1��Bm,�V���I�h�3�ک��X����Ga�vr��G�y��UO�+*z���5#�����*���[�Nj�x�/�ehߎ�㓬n+���}����g��,�M��R�Z�di̘��G�\���-@ᏻ��ċ�\3��iőx�����Se�� �pz#t* g���s���LzT"��TU�I��>��;�r[�����T��:�����&�ܐ"2��$f��ɧ��J��_ �6�Y�X�����À���s�'�ݘ} �'5f�bPf�ȡ��b� >��0ńE/��"R]��I��|��H���oչ�?���
C�	L�'&��6�֥�DG8B�� �Õݬ�<���e���\~B���x��QQ�� �\���J{�]�{S�h��g�ľº��]���o��%NF=�qj_�G��9���E��2y�_�n9����NfA(P�@�P|U}/�����:���b���^���
��xͻ"� [C���ڝ���̵�b�%#�@���ʘ�~��j����m�޴�;3y�9<�/��?0.��I��~�vA��`u����p�c_��`����j6�.��S�=�����A�Q � ����b�tJC*�q^7('gsu�y�.��x耨�s1��@�F�}l�4��,x,N�c�?�!h #�]�D�$�Ôc-�VD��Bh%���|h����ِ�_�k���c�����As�ch�̰>̇2L�š$����,��m������x2X�@@vc�B��	",�N u�":a
HB?!��q7�l񹤲���qe&���k;��sR��KFT`� ��}��X�g<�b���C'��P��Z@�����'�0X��ax��Z^+	6�u���\I�}����|4sF��|�f{���W�8�ar$w�3J� 7��F�n��	~�=�8����7-L�5�E��k#�y�j�#>�hltĚ�j\���\3�)t$	��"�z��T�cn�`I���a�_�հ��LL��p�7'��W���� ԰ap�'j\^䋇�FX`�`�����u>�T�0�t�p��l�$�%D��r�.<qu8����O[���� ؝7Վ�p��a7���xF�S>+U�
ܸ<_�4�0<-��5|���=Y� �D���k�78���8��:3� 0��@3I�E�AcJI"�����
jb�/������Bm����Э73�]$��=@\
��7X W�Oj�3��m��iԱ����ps�	!�EJLv[˳ߙ�T��5R���#;�����SJ�HJ/-,��&�.�OZZ���z���D��%�
*�EB1&���s�pB��Q�MN�F���V_���z聋���q=*��8ƸP�&���L���戏��0����ʚ��������d�O��a�m&)�� mJ�Gm�R�n�,��?�� �j���1bn6ݓ�M�]���nY�<T��%�MFI]n2��ϸƆ��5YU��5�����^�
����	A�1�J���r�[��/���'fU
��ۑ�e-����NťQ��5��_����0�f&<)�����:�@�9�3��Q]���v7�������gY�-c�k�s�%8
�H��-�9�4�	�x��?X��,�v=K� ����S�� �@?��i�n��%�lx���C�y���,�/&c�M�fAU��5EM,��6��ɑ>����}�]�L�`%�$Q889&7��1-�˩4�� ��9ux��M����|{-���K��3�5[p�h����M�t�G{5A�?��ݜh6U��^_�D6m������R`����!�&�-���	�d��+ �[� �B�Y���l4=T��'�^���s�d	&�@u
�qhq�
2�������LZ 0�Y��i.)���܀-)�ڱ?}��@��H-t��q�\�u��9��3㰐�6��fzN�������+g�6���]{�?]$������B��nCE�������w����Ҧ-׻�5�u�>����u:H|K�1�g�������fI:��Ԟn�`8E֬��6�:��Uwܞ�$D�[r��~c�P�������>ɅT��:�1\�0�U�[6������'��߶�=�~`<PFJ@A@�8�����k�;��Y��n�E�lJF\/���z&���U`TZ��4TO$���~��E��E���������m�7����yu�7���-��F����^.0�i��m!w�0%��-�?��D^� ]��R��$U�,m�~�~����֢G�hf��̘���"�+0N�[��;�[���Q5��澄����fj�^��Ʊ��w���L:@���d�D��%K��!��	͝�&�|�?C�l˦ߞvuW]1)<��i�����=Ui`�$4	����<�=`e&�" ����`�kV���}�G��_��q������RL�:z �!�\ G����^�&��c��>��ٗ���'p�� ���%��B��'͙A{�!��Lbp�̬8z���WOmv͞��;��6V�=ǎa����ux�LYx5��4b~M ��3 �Ɖ[Fl�"k�Cǰ���w�=�E��^u�#\J�}<n<&�_�H���H��v�e�pv�D�5�o�7���e�'�^��g�n<� �8�64��p��9\c�䄋�q8y{�5�O_?Y����G������x/�jF�0������}��:ԛ�ȏ;5�M�_���_�� ����=�v�b5�ϰY	P$2PPYZw��I�.0^���5G�=�ǆ���vc�Ȫ�iǾ�cCŇ �׌@x���S��QK��[�DԜ��P�����f��)��<~��C��d�%�a�qB��{q� =DBjgi�Pn���xZ������L�h����~�`2�QVЁ����$�s�Kg�����ԠnZ��&o��-���:z�vˎ�s!�u��e�$;�c��T;PAP�IƝ5�1�X/���"n�|o���yS��]F�s$�:�O���d�e�r��D�����}#����x��K����]ۏ�Բ��q u|1N+��P\9V+^B)d.ظ .���S�|-�C�_p5�8v�&*�K�R8^�ʄ*�HH���y��T�L :��[�x�!-zz��`�oг��� ���:�M�,�Gp/�X0 ��k���dsI*��.�s*�V��%��U��~ѭף    "8�r�%\`Hy��#@��x(���^�gQ[��O�c� ng3���Ù��m������$��ռ���WNn�e����-��F�-��]����Կxx��O�k4}Q��+�X^*��`ؕ"�L���%dA=�����_�o����_�g ��p�	_y��P���8���	��lh�g�0.���㡽��Iغ=u������_���Ԣ
'Y��Z X�;&����I��R�
��Y54����q@�x���K0!P=�tu���duvV�.Җ3qM;��%iN���"nCI俠�~{�Q�i��9��&���7t�Y*[(f����9u���ǎ}����X���`�呸���E5l����S3Ǚ�� c(i�H���Oڙ�8�,"hY��S3.��ֱʈ�����*��$��S$K�[�ns�����t$�X�f��}%��*O��iW���J�0t&[h�E�I#_�0C��v�.z"S����/`�Ң������U�0���>���w����,��,�S�!&J�n���E_�x��%�ר��"n�p�����y��%f�
5CuL�V����:�-�4����P�^�ۢ�]����.������-��4���X :�� dm�2r�-�
#3aL�w�z�m��֧���zw�$���:M�x��n���b.�$<bqSTA�
��u�j+����&�W��u�U?=�@���c7�s�Ԧ��%o��(|�.�g.T�"���1Fo�`�'�/��ru��\l�����o��sM"1#&9)S�X��	��� �B�"�lp\ �Y��ͼ)�����O�7sL�;f	������(�	�����dw�
���&�7��j׋����� ��$���m%�5\
V1kN����Z�x31��s/8f�H������<u�+}�qz���հ��/8��T��o.�u��a��{��
�Z��j=I����.p��o�R�Ϳ�����Ô`�;�c�Q��f2#)�����1�Iu']����-<���i%bP+�q�{unGV���U0 6,��1`O,�$<M"~3�܇;��ݵƴ�=����Q������קu�8�%�N, `�c*��u�jJܖ��{�)��n�x}����OC��fm�c�ᴕ�d\,�`�K��<1� �&��d��)��:ř3�9����Ӯk6ם�q�i��HRf�A)���V�YIR�C8D8����/HS_�I���i{�� #\�z.�����[`R�	`��:�f�$��b.�b� t�d���^d���x:�@��������ϋ�Ӽ:1S���>�i%l,�a��x���U���yz���,m�����J�o;	��8��6�0!�8�0�	`Aj����i�`���0��ڱ<��-K�;�{uOxM.��a���J��c�z�����r�yz��1ӧ�ꋸ=�#�Ͷ?ݢ���JFS����};�5�-FcY�fq% .�#'{߲�6w'�y��=��E�gZaN�¨�|��
�8I�)I\/*K*�N���HȺ���	j!�]-����
�Th������o�e;d��f`)"+|ۢyH4���ff�9M�;!&�����=��O]���U�P������ٔ�d�� �ȴpȝ<�\΍I�s�; ����wam ��ϸ�G^Y��,#Hk��aā\>;,"�Gd�?�����s���O��BV�įN�=V���X�w�)��9�Q�&�B |��frF�p�,!i%õ|����| _'�t�+8��f8댢���ҧ#����^��q��BF�Y��%���KtS��'����-)���8�T80�5�E����/�LK�`�<+
We�&���=�`�}�}`�����n�Ol0K��$4��8�6ǹ)lی��}րᒫ��"� (�w���Jܖ(���rb���&;�/��#Eڗ"�pkDYgJ�c�j(w[,�ၵ`�`>;��H:�Ip�QC�LX�w��ʉ��D��~ -���-��ӓ�z�2�*{�.��z�%���9�p�����-��P���Y-��Z׷8W�u�7���*H*�N4Lc�Nbɲ]�gR���\���R�e�[��~Y'��w7���DX�q���,���g�V�@yZj�MѴ�B s��av�\���WgG�Cu<��r��5*ҹJP@���0R`��p���F�=���9�u�;��v$�0/{yI��v�vt�\�
ThP��VX���uЩ��DH��/�`A���z��]*���6�ca/:��eK����H5R�#ɒ6V�hZe�}�Fq���Cb� �~A�<㉳��J)��O��0}*�_o�Sǂ|��V���I��`W\����D�L`#�P�I��e���O�mP0��W��M����u�Px�yN^�K�f�O ��%���1���@�5?F��e���_m۴S�D݌rZr<R`"�Q+��)6f9���j{��[�e���{�fK�"��Ɲ�s�N�1(�	{�s\UG-�� 	g"�J9���1©��k����W�On���#l���p"!����Fs}�Sus�`pu�^jv�r��,�I���-q����l$�E��,s� %j�m.d��V��!�ۋ�[���\	eK��<�%Āb%�J2j�f��&5��E<�)�)�\�0�Փ'�͍�u{����v��r�V��HD�dz��1p�#��8�ivӠ���B����$캲��gMŧSY�<��BŎ�H Oj
n%��j)蹚hZ/v�a\�Y���{j|6���z~��*���Q:,�&�XX��*7؆��ō���:��v�'�E��}���)��8*X^�̂�a�9۟ �����P���j=	^�o��؎�u�'_?=Zzr��p8J	Xe�c��	��:��@������bm��.: ��Y���:Vj����G��Y��
�C9i�9���-Ka��v�	a�lA��Ⱥ=Y4=#��۷;����n%��W�����îQ�区Z�ֳ5���:��Iqũ]׳��K�~���~nx���V�SS$��63�|�� N��U�9���Q$)�q�³�غ�>��j?>>����'��e�U��v���2=�E� �yV����pDc�I=f���*5�I�}f�3�Vg9w���EzV��r��җ	���p�9�Z�E�1����Q�A'Wͪ�zvCٜ�-�����w�}ռ����wV�mg��/y�;�pl`5�+4is=��I���0���7~�-ߪ�vC}ƽk���e��{ɰ�F^:i���o�z#�zH���E�owc���O�7�z�L�Y�= K�=�_�9K�+�y�����������`Is��^�♰�	�2����yN(\�n��)�(���3����^d�Cy|쎇��=���14��4�q�����D��l�l���)��w�1��X��令{�gH�_=iC���G�?��Ӿc�'�r?#z�;����B�i�-`/�
È>T��O��KI������@r�����]�mw�Hnk*Y�P(�m]���zs+8 ��!muw�����6v7|l��z[��C�q0
��X��X���4�%���w�5�O��+�����0{��c����v	���.�;�eŋc��0|s#�0i�C���"0ν}��}^χ�P=�	Q��}x>nV=�Fw�Ѳǉ��B��p�g�vGP������F�6T����fsM�1��i�3D�D���;;��<�x8��X���PR�t)�#�	ߎ7Z5�(���p��O���R���
���"��3,!�_�������.��(T�"�O|O���G��-��Cu�<����%�2<��	��-x��}�[!H�4E��'5�!�6��X���?F�
h��,6f�B+�W�Ԅ݃�e5���p�s��R��^faX�Iػ��<������ń�ˢ�QR�y �Nj$σ�5�0LD]zy$a��K���(����@`a����}���D����x����ɭ�R0M���-cv`p�`�&"�Cy��jn�    N/p��c2{�0T#��;M�e!��w�\4��~r���㨲�D5I��M��]�ю���ts��&8��c� �nP��TǥEj�[Ae�Oe�}����^����\`�X�&v�p��Ll1Z��15�a��.�f%��J.�Տ�銂��_�U��؟��-�]�F�'�f��-[������5C��d��$����j���ԛ�������YY�K=���DV@֎?'͙�`�O��j�(¾)�ݵ��4�� ĺ�C�!3��e�a��7Yg�p�`�Ʌ���^x�0�����e�Z^s�����y��o&�a�#��g��]�
R�貱�Z�/�h��j7�5�[��-�c{�BO��,&�n���4� GVb�Y���<K��������Bs�x`���糖dX^����w��i?�������,:�������s2�a/�7=�0�Bɲn<�z����gmII�5VKT����4�B���#�ڲ��"�t�ؘ����h����~���>z/��t�b��*X�$�%1��3D�P�;%+dn���5��B�f��I�w?m�P J��I�*¡�lDЭ�f��jF��L�g�9�堺�����5��]9n���]�no ��]�ZI_0)�Ʒ��@E��H/�,�M
H烕�(�p��4K-D�����i��n-�4%��"���X�9s\g\sgt�K,��'�(��8	��7�7/1�y��u]ZC�2�`{�A���I&sv�T� 7:,��׮���M�
,@�~�e)D70/r�/c�L}HlƎb��2M>/\��-g��߂���'a'�gl��t-�.�
��ux�T�4�G�~ö��Es�t� �3Eg��z��&XH�e���C�+�����T�C�3'fN�	$�> 
���&e�i�؅��m��?��C�?�Cw�m�%�z�n��)�� ��Hv���XL*H����b"Sv���Y:�ZU�I�.�uu{�Ul�)=xz����a�*s���ǰ��5�7FY%�PQ;���긹���IJ�&��f��vr�p��i
/�/�p}��R��y4��7����E>1����}}{��M���S���m�=���x��RpDY�i�l4�i��Ȧ�׊`�����!��F���ǲ�\[���z��1��#�x<�|ࣂ�7����$�	��*ɲ:	�
d7L��������o�4���7#`�6�%�yF�HT �)g36�	�ρ�9�����N�?kS����:U���T֯[����V�|&Muf��W��E:��p�X����g#�W�ju�^�X��c�������9�Y��C���O��I��)+7�\N��Kٌ��ݱ��m��o���qn��O4�ת��4z�X�߯�U��}.^ҩ��/X��lS=y�?�Y�p\�q��_�҄ղ1"�:���� g�_�\6��	3���w����I��Y�R��Vn����m#Q2�Ќ�mG7α�+�n2d�M&�����GT��E<�e��o��8��#p�T�cׁ��rGc@@�'��^�3��a"�$���`���q�ۆ_X���@P��������=o �pVaK��U��X�F
=�;��ͬדl(�)rf3A���}�\vl��r��ؑJ:N^�׆����`��n��L	�&�`.�mF3�W{`�0�cw�(����a\�a�(��l���l���ł��v�Y:�yxB�ak�w�������zTPE�j� xF���uU���%�4��C{�|�/��]q@�����$�}Z��`��Wq��፷lt�NM�t�mϋKzL�S-	�3�ל�/�}}spW�<2�^e�����S��kT؂NLIf���S0��a*삝��f��P~�|{��KJ�ݱތ/������P�A.�^�8UL�b-_�J��]����>�W��u+=�9�%7����0��~�[+�_�%�p�?�lH�����F�,q߲�};��#�f<sr� ��.dJ����/�|3m��"Di-ҡ*^�'�l&�����)��c�I�\4O��7&L ���KM����[�W�P��&��r�<; �������p<a�XM���kHA#���I�aN�~)��I��%���%;F"�[�-���LtDbi�/���`������bYN^��������4�r��(����r���/r	40�Ɇ �_2tE��D��D7���LCU��ҡ�iv���|��3�l�2f1pQa#��uyh�K��&1��e��9 ��$V�3�5��lR���� ��v��I�xq��kMXE'm�$�J�T��e�'�.�U{˩��}`�>5`����2 �i@���5ydL��a=�=Yra�39l(6� ʠջvd��W-�YU�	'�i,��<���W"q13�d=D��˨��Y:tߛc�) ً����%Q�v_^q�����<�mL<��Uϥ�٨U=K���96Փ���{	`�}eWwx��x,������ь�E3vm!I�jC�p�MOR��)G���z��m��7cA�	�����c֒*DKc�,���W�-�D]WO�|W���G2��e�	�k��L���C�&I���u1��υ0M���EѰ�I*K��8�
���w'Fmsx�,Y��ai��GM��;,��s��=b�z���J�eJ�9�<,�=OO���� �0�������=CGa��� �u�v�}YOBk!�OՎ�����>c"�;{�l|D�3yS6�����-y��Qd��"<VC|ڰ��)d��:\21�	>�?%�+�]>'I؄�#��f��s���U�j���,C]�u?Ƞ ��mOh7~W"�
��X؛����^�li"�Ɨ'��E�B��g��Q��0,�K�z����Ŗ�����n�g�h!����a��w���;�κ�&��T{�]Kl�j�;�͇&�����G�i��p�1�O�ϫt�/�ݑ�ݠ�X!W�(f�<�r��.�S�Wzǰ=�Us�����p��j&��(y4�p����ӫd�F�if !�]~��J�M�#U�D8<�u]_ast�/\�������^��NZ�k��%�S��%�C��c�p���OW���ӊZ {�������i/��GL�����'%��Iԩ��:��R��p��io�V�0���� Ҝ_��'F3Ø�~"�"�Yf�EZJ�Mˎ\VW���見�t�:�,�]ʸug�5>��%�p��3wҶx�m�O�x�̘&���2�/�6�a�+��e���@�AsK�W��!�wd��)l홞�ހ� �l�x�M�b/>wb� )���zT�N�?M��c���.X֯�K[m�+(*�\���"��5�S/�a��h#�2���B``r�JbЌ��d�l�a���(��p��*X�r��I�%�M��0���q�eg_#-�#�"3�EZ��,���##�m��5T���󍐰���#.ܮ%둄���r�\� ��Ƒߗ_���Of���÷.�і�ps���@$�iS���L�ar�����������:Z��FU��z)�����#��]%�����z�$�&Rt�s�U`ᓁ+J�&m�-��mz"��uj{w���\���ܖɫ���:��M2���rz��!dfZ��xO�Գ߇�����h?6��՗!�  ��Vgǎ�`I^ �W�NǹE�YQ84p�y�w;���c=�0���N���C��|>\頀p�;)h)a�V@�	y�����B٘�i�����+�JҪgK�����^C�� �,/����ċ������Y"{ɳ�C'X~�����2K4�]�9�cyT@�e��lI�
p����V	B�cclׂjO��Oұ�6����d~�p�d��Z�>�B����eFd e�s66����r���cS���?<��fؒ�N��.X#��!��32a�Czb�����fQ2��>b��E<.K�g�Ңۋ�z;W��T��l���a��U�]f� ���+̿�-aI�T%��
ݏ���S� 	#Ӝ=rס)�����L��h$hSF�K����ǀ,��U�p    {.��f.a���V�'k���8yL��mqa0�`�9s�S��-&�b8��j���r�mGN^����@�e5��"��}z9��(8a�ś�Jk��Y��$
��,�q?�qSn�/O���0����1X�#�y���Vfb�-�=c��wQ��=�FK7Zd��R�'��}kt��-�	e�޴G����My��h
?L��`G�IyD)P����7Kǻ�����;��m�{������CW���*EVN:���}q��u�^0�K�x/�������R}���f�&Á�8�LZr
�g͐�C�եN\>vB�K��Y:n�:ĬE}[I��K�"����e�K��L);���d�04؂ew��tܕ�YR��������V���xfq�+��e�{�����B�R�A�3<��,�Oa)0�3gv�hn��sOY����5�8E�t�|
�֪9O±gei��27x���9!��m�͂+4C�,k�28
�˱�)0�)�'vͰ��Z�甍�r�*���niv:,��xVQ'��YdI2X�I�&�6^�82�ӥ�é풲�s	C��������i�����L�H��)P����pkr�����D�/�PM҂�P��0���l���E����+���z�dd�Q��S�N@���䈋 �y�kv�x˻nw��n����ð�'��I[짡H�d�2'�rj�6��lg'�Tw[���o�f�r>o�.�<�2ی͒���&��8��5X�9�륳-[U�8��x��rs�v�:�\ߋ�4n�𼙾��郡~�o��B�%�p���^�t`��o�x|�׷��7�V����S<�~Ǘ&��4;��28|X�2��d��L�9�������\��'�'���S�tT�g�ał:�$s���K��0\}}�')�c�,�<�p���Յ����K���~��l+��&>��K�U
���wH�&MJ)K�I8���&���-��lyj�Az�Ia��±I���44l�9d���lx{?���[���͍<�V����c;ۂ���r8�kC�j��Ѵ�F8��q8���x��]���M) ӽt9�m۶rw}Ĺ�Y1�8���b�Guo�AD��0�I�������I�m�?	����Us4x1[��
���3��9@DT)OطTp4]M}�O��#��\����n,p�"\=�T�(�[����̀<^/H]x��b˽�%E����u+�z=̳�k)c;Ū���}�$�av���,8}��8���9� RW�{�Ov���e�0t����=�-��VB��ɱm8P���ntl. ]�8)5���^���I5,�k/��>Ko�v���9�]�)�@̹�M��O�P��d����E:���hF���+�Q{�0��,y��f��h��RS�d�<�E�KU"���ƌ1�ρ��P}�D@H���J���3���x�ͥ3�1n��ُ�p��Xmo�濨�9�y��L�p�'u��,�:�~�������f[pF�"�ҏkB��I}�{-����)��r�0g7pMlqiǒ��Ƌp;��z�dIͿFxR�)�OK��0I0.PB���:�96�9N,��q�pn�Q�Wʦ��� S��n? �?�P����7ӱk:��N=�9����I��652�/-��*vġtjʾ��̓�9��E[ew�枕ry��=k����O��ZY�{���$�-��U�(����u�����\�-9ϻ�|j:��Ȇ��NG��dOF ώ���~�"���[���1$jl��:����}��bg?̱%�{eY��S�GE$/�p����ZB4��j�B/\�!�O�=���di�8IE�A�%qh8�2�݄Sʹ0�e̹�t����U>��z�B�I�� ��X8D����X�>c~�"�{.�y��Ɖn�a�M��c}��}��pY�B�[Bq�V���HlckAfl��j��<��3�7�����I<u��~ej���xe���0Zv*����X�D@WD�s`�U���`�3I�e��O���_h=6 ����T$��	�Fp�'!#��=7�pz����z�+ù��^LW��$U<�޷Ւ�L��
���<FJ؅Zf12�nĿ��)��6�^�L't�N��;�V�ͿC������8�����%��jd#��/l��;��(�v�P!���p|�w��yY=�̢����qܻ��F�75�K=^r�T�X�ݕzlD8��k|Ģ�?�"����rX�&���,Ø_����422=Y®
.��(���*�xF��������^ʃ9وUF��'�ᄕ�f���Hd�8vP�Dӏ�i~��D�Xn��]ܼ��Q=��g�Eaj�>�h�/���e���zN��USܾ��R��5n���=��R�V#�+ϙ�(���)���B#�{��"��o�x�9��R�D�� ��e���W�������H2��Fȏslr�n��Qd�Xv�����e?���z�f�X\V*'O����+L#Y�Bl�N�2ث^N��Xr��c[��-T߯;Lxu�z!�wŴf���g���û�\$�b�K%���8v�s��"�Nߍh&#����۪���ybّ��c;d�h��l"��sg�T�3�9U��$�~Lv��m%<���n�C��V���b�gM3�#�� \@��4�pz��JHN��^4~�ԣՑ���)W��	鎙=8eťF.`b�2��j���E
��9���=��Y�-3'X�A�?G=��8Ŋ�2.�J�q:1A�\?��d:Oف�����82���^��0��ۋ�����fQ�n�Z�Q�}C��t�Z��n�J��jh��~�y�{�cWmz��q��s�0���m�|^\gŻ�����f�
N��j���}�T8&S�Q^��l �8���se�*�d��ه��nq+�+y��w�މl��o�P�_������T�D�黦���gg+!b�脷���	8��iQ�f�������N�r����X'D�2�Q����5��)��涒��N��n'��<�������J��u)�{s
�zC�Î��E9��S�+Qpnx}-���1���	�v/8���L]S�l�j634�n؟4F� ��Ll�B+Eb��@_f�\��wl�ǖ�~C���(���|1Ej+'.�uŵ�,X́W#;c�З�r%rf,� Id+_�_����' �3>�c��Q�9A�/�e7!��l��D�8x&�H�/�o�Z���U����I}��S��}7�3f$���k��9W�Õ��*�3��3�6���x�U���� F%��:��g��L��m��L��=t���ӀY��p�Ҳ��<���=��V�!�^���d�c]b�3m�4P������𒄺��`b�X��u+�U�4��kM^���͡��)��L<M��rr���	,�&�YE��"^����q���d��������@B�x6{�������?$�Aڵ3N�����c����o������K˙M&�N���4���9�L��;�V�ˇC2|�Bw5��~��`���@�-!0�ѓ�<���?�iS��mI`�o��x�Àɾ!�AF��tՖLF��Q�,����i�~c�f�ZN�B !��86�+�T~���d�"�82`q\��ժܜ���2yrJ��裡g�Y�Z|�u3g�� �8�ɰ�Lڒ�K�f�
:X,��e�����3���Dۉ���ĭ8�V����D*W�������ȥ�C��ruh��6?��qh^��҄	�u/b�rѳ(��CȜ�)��F��8B�!��Z`Ѵ�pՕwX��ſ����[�S�&�\��JJw�q�A���Nq�,�exz8���]�~������¬k�����'r�挣�bc�5���У�JU������f���������{q8�nW��N�iHӈ����\��Jwl��lѤ�E������
{��D:��e0�m����|�W�s2t�����_{ؘ�E
'e���O�6�9=�mi
�]�t����"rN'v8Dz��Í�2��!Z��_}�^�c��AU�b��y-F��� �8���s#t6    ��SG�\�fIɪLj�����a���+)U���K%���&q�CN�O��e�ff��)nA��>v��%��MU?q#��������Y��s@*9�l|}��������،�1Ϧ����e{��R ͷՏ����㿲���<�~&Z@y� F�&�����mW�ˋx5��~[�Oj���Uzq��(9W\��>�)�S6&��L(��_���7��X�9�j�g�j�~ ���\5�\V��$�¶�;N��!���i͆s �l�=9&n�<�p�8KW�����������$H�����N���4�:�����ıa���$\��O��
�۶�e�:8a�}�e-��� �O�\��lf���6=il�x����1*Gs��[�X�U�}�H���9�ɓ�Y�ͥ1E��f3lE�p�����Cc�v����v�>�[d��� �$K`i U#��\��Ր��S�oV"[}�Y[�S�=�ּ{�2�Ye�t��r��༄�ؕ��ȅ]�=��:([�˺�>�S��^�4�H���2�\&d`W�(ǡ�pt8Z���:5~ꖧ�r~���ky�Vr�.�(1��@�̕�6eރ]Ap��C������.�@6�����Ojj�~��o��pZ'T��]��s6�љ8�M�^��v�L��H��L�e"�ȫ-ek�Mj7�2q`���v�d�++5؊��.&r�ܜ�\6�-b98���2*Sd���7�=]u?#ϻm��nɛ�FqJ�s�f�� ޲݈PŦv&�� �,x�BE�6�Nj���1;���w��)�^,��v��X�*Q/���ѣY�k�*��$\�o+�sc舭���o�����"#��pz��Krlq6ض��-]z����w<I׮lp��U
���˙����en��p5�D�M���_�r���p��j��Zjs���/�gI�<u==��ͅ�oNt?�O�Ѹ!0� �38a<���5E���eՆ�u(;�~%�
o�p�9.f���G�I�5�)1V��O���<��kV8�`S5u��:>���4Hq8�d�L� Jk�j)F� X�V�����IO��H _ I��u�a(7{���u?tP�o*@�kt{���"y8��9��Ҝ�l�S�0d�7"[W���6Q����O�bT��l&#l�J$H��S�)�8�_���#q�	����g��c]�0К�s.�SCs� ���!Q:Ncq��gYN��)B��F�؅��Q���;ߕ�ϻ��}��R��Zm�\�$�`
�fd�H��p��<]Ɉ��a�����^~ݷ�I�z6T�^��3酚�5�Ɯ�Ė�,Y�IuaSǇs��k��j��lݖ��뮿o����kR{���`�D���9q����{By�["ʌ���?�Qىh����9>���]�x<���@�A��ɞӷ���7�	����Fv��?�7���,��p���C$�l�Og��)~'��ː�6GJs͠�)Zo~�ѳ*�uK#@�~)��5۱���Աr�Lar�_ftM}�����b��)Zw%���l/�9��d�{(sL1��F��a�}}J+Y&/Ꮁ����"^���;���:�B~����)טi���l�+�d�n�e��MҠ3iiz@�$[����8��'X����I+}6�ĭ��79a��ɡ٠'���K�\��G���I�ޖ��x���?$���f�VZی-�8�G2qlk`-{�y���8._�4���p�c����8�\�W��e�f��� A��D!����=�5"�	�����E"8���U��?����>T[���v;5��E��C��d��
�z�t%��}~�8��p����6B�͋���GxuÁr�g�s��@����y�!�Ӝ�h��U�P�r����a;=ިO��&�}ѶuKE�y��5	\똼�/I�"-c&K��!P�T��j Z.7���ƶ$��Lbe?��-l`�0=�4�����Âgd�iJ2B'����� �s�h=|O��c#�v�qsO�&��m��1�D��L���%N��g���H�qdgf�һ�$]�%�CU?y�rװ�-='�5�<p�XR^�*���';h[9qJ�7��I���p}��� ח��߶tЙt!�42�JV���M�D!	W�,�Q�#U�'�nE���}�D��V���vTϱ�q=	H�O�X�̖�s#:)�#�X��vpu?�����m|����r����RFn����, �$}�s��R���w�I4�$^?~�=�����|�i����g9L���	�b]u�|'��z94�k�vM��K9�Nk���h}o��+pfi��i�81d_���1'�ͥc>�c�zE�>��ᴾ�8�Q�im؀<c顑��a`��Q]ۉ �a��������/���ꘘ���:ؖ�Q�
��2��^��3��e$˲�g�y&���n
���Y��s65�I(?�u�KG�<6� Xb
�Oh"-�Ü�8�F{����;T�׹L�{�/`s����!�9B���$��D�	���md�Y�\�lS�0�����A�a�t��b������v��H�3=�0�L]��m�U�6�\������A}��ݡG��rv`�4%l��I�dD)��)��΍yH5v;�.Y �؟|�����`ȡ���ے]�a&Pt���gV��֢���GH6�\���	�g�ƈl�����{ �~�6��_[��۶�E��ɯ�P�;�o̭I��Nz��Z��[$ٮ�뻾=���y)
����}]{�a��PVR,$���0-��;�WqH��G��)�΄y*�܇��x���#D�2D�E�е�mKϮ#�jqn�)�ΐ�qKN��7vh�:����oTǯ�N�_T=XA�»�yk��,*V�d���{Y������{}֗�!>=��Z�T
jb8���>H�=Y~^���vZ��@i)9�AZ�2̸o�߅��+$B�ry9�ҁ��%W��-L�yR �����]��:�b��+���m��c��Bō�oo'�f_��Ar����6n{�i���ޭ{����&�o#_t	q)���LZ:���*pxc�o�  s9��f���p6ƨ��b�?+�-Z��t��*��yH��'bv�FD��'?F�>tK��爫�c/�|^��U87f%8�࢐D(����R&�؛tAf9J���l��S�����#>����� %��yd�v����-�O)S�I�Ù�:�4\�t����럸}�Z�yL������y�~�aUB����JB}et��Բ�Mor�s۸�i���|wq��,��@��Dr}܄1)���/�Q�5���f�A�3̒��º7�~iT�S�Y�c�~%�Jfu~�X�G)��l���z�I�\�{�A�Յ�pn/�=w�Te��{y��!���L���U�M�AH딅�"��F��M�F�z|�I�1\1��
=�BV�4��n0��F	���8��Sk�*
�qm���R9��'.�߻+մ*H��L�����w"^�T=��P�=�y��l�X��:��Wp�]�|ʪ�������BA�m����p�hYd-S߉o�V���V*���c�7�q���'�4Z�6����8����h�`
�JO�Fc��Uaɧ��@޻M?���9N��G��HEj�Ma
C�V(0���8�� �v�h�(�ha�����&��bx�t��kԴ��;�##e���_�A��M�A��\X$1�SY�8�ּ����h��~y� �K��;�^,�^y����~�("��P	(�#��u��Q��ƶ��K�8���*~��Dˇ�TWYIπ�6��*��iY���d(�Ha��r:����ۮ�OO�����ۄ������� e���sJ�3�2!Z���ș����ao���C�!�����#�h��Ѳd�5|0,��ͧO�����8��4��.�,�[��OO$��g\�\�f�����$,h���=�C�C�%?Y��C *��K3��"*U��oL&��;XS�nW��n��S�Df�ZPDW� p�XS�1����m����$�Ӌ�qd{TQ��Ry�K٩ESߖeo<e��r3(+\����j��ғ˷ �  ��;�ʔ��̮p���Ml۪nh�BU,?Al�=W(*i˶��W=5�R&Q�����JٺR�Hl�-#��\�3�Wo���-gL�ڬ��gA����&���J,;8@�������$��5��ލN�p� ��o�c����V�̸���տJ��0c�k��qJ����:�$�6�s�cN�J�!�6ǋ_hD�۰���Pa�aI��-�P짼<���ո��w+fT��C���i2�
���|���s��n���AR�߃��a͚1�%=��:� N+˝!/�����`�9-�a?�?�ӓʢ��Ć�˱��&�îEj�9 FF���LϪnh��N�֡��g���հM���]7�d[=��r��ɣ���{9��M.������y(��&j�����@�'�j��8���g�Z�s0�����"G*�Pu��A�oyy|u���I	50٬������Dyь�A ��5�M�e4u��w�gj��{��
\���aw4n]TU�dY���cNa**�-(k�Qb�0�\���*��j��$�*@����S?�6�!�Z�ƀL}����]Λ踒;�԰71�s��\�I�#h��tϷp~� ������dj�d����j�Gl�_���g b���awE�|�Ws�os}T�n�QQ���iKʛ�۲�����\.�q�� R͊�>��4��n  RR�����ee�5��*���8\��"�G�w���b�ƾ�\�[��K��I�۵ݕ���g� �P5�n�q�;���~�����Gs޺�d��V~���i��	Hi�^T�[�h*fNfB�����"߯�m��c@���4γ�8
��u��FKxd?M�Gb��GL��l��z�*��i�=k�	��?QI�m�\,W�7�i?6
j_�ei䅢q�~�n"������׻�CD���d*�PL@S��⧙�Z������t	��j2��.�a��#:u���&�\R��G2ti��@��2�R�Q�P9Ӭ`/yy���Y/B�����\�T��r� �a"��P!�����#�@a�[��lê�p
8aX�ɧ;��5d�5y��ǫ@���!F�z�᳑ �08}�c[�~��Mw��-\~���������W}��,�:Q�n�ו��r"���y�K7̣q����Og�}�izP��W�E�-����1sң�ڒ��ڂ��=��{J���֫��@ԅ�J�}I��:�r8�ی>G�4��QAI�����Z�v>��@�y�(-��;<��b�������ˢ���V����c|��i�yc�U9�5���T���`mIU�#RC��ʲ�N�3�5��y�؁�<�S�	�_��	ǳ}�ua��)�W�K����{ef�����*��V�go��׳L-�O�d���7\X�m�w������d�a�>&�PJ:��I���ŧ*���+�K�*<|����Onmƒ��n�6|�yG�ο$��A���:}w���EI$�2ȡL�Z��%���6�ej&E��q���)��)�+d�ʆ>�P�Mv,"'TMEi������PR��}\�m�YF��z��Z6��m�=�m�p��(����7h�S��&!T�C�l��R�w��4�:U�1θ�6�����vb�)JL(���b�Y?�R#�U�X���A��>e�{=�m�{ƫZ��8�M?��h� �@�4�ӌe�pxb�����؎J9"��Ϡ����ŋ�\`�      �   |   x�}͹1Cј�����C����a�8���\R�
	O*Y��S�"��1��k��q��b��Y]���N��oX7z�Vf��#�����A0���OS �Q9iyf�)o��mU\߽��<r*�     