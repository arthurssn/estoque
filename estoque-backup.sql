PGDMP     9    ;    	            z            estoque    14.2    14.2     ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    25109    estoque    DATABASE     g   CREATE DATABASE estoque WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE estoque;
                postgres    false            ?            1255    25123    atualiza_estoque()    FUNCTION       CREATE FUNCTION public.atualiza_estoque() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
	DECLARE 
	disponiveis INTEGER;
	BEGIN
		SELECT qtd_disponivel FROM estoque WHERE cod_produto = NEW.id_produto INTO disponiveis;
		
		--IF disponiveis < NEW.id_produto THEN
		IF disponiveis < NEW.qtd_vendida THEN
			RAISE EXCEPTION 'Quantidade indisponivel no estoque';
		ELSE 
			UPDATE estoque SET qtd_disponivel = qtd_disponivel - NEW.qtd_vendida
				WHERE cod_produto = NEW.id_produto;
		END IF;
		RETURN NEW;
	END;
$$;
 )   DROP FUNCTION public.atualiza_estoque();
       public          postgres    false            ?            1255    25125    delete_defasados()    FUNCTION     ?   CREATE FUNCTION public.delete_defasados() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ 
	DECLARE
		disponivel INTEGER;
	BEGIN 
		DELETE FROM estoque WHERE qtd_disponivel <= 0;
		RETURN NEW;
	END;
$$;
 )   DROP FUNCTION public.delete_defasados();
       public          postgres    false            ?            1259    25110    estoque    TABLE        CREATE TABLE public.estoque (
    cod_produto integer NOT NULL,
    nome character varying(255),
    qtd_disponivel integer
);
    DROP TABLE public.estoque;
       public         heap    postgres    false            ?            1259    25115    vendido    TABLE     h   CREATE TABLE public.vendido (
    cod_venda integer,
    id_produto integer,
    qtd_vendida integer
);
    DROP TABLE public.vendido;
       public         heap    postgres    false            ?          0    25110    estoque 
   TABLE DATA                 public          postgres    false    209   A       ?          0    25115    vendido 
   TABLE DATA                 public          postgres    false    210   ?       b           2606    25114    estoque estoque_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (cod_produto);
 >   ALTER TABLE ONLY public.estoque DROP CONSTRAINT estoque_pkey;
       public            postgres    false    209            e           2620    25124    vendido t_atualiza_estoque    TRIGGER     {   CREATE TRIGGER t_atualiza_estoque BEFORE INSERT ON public.vendido FOR EACH ROW EXECUTE FUNCTION public.atualiza_estoque();
 3   DROP TRIGGER t_atualiza_estoque ON public.vendido;
       public          postgres    false    211    210            d           2620    25126     vendido t_atualiza_estoque_after    TRIGGER     ?   CREATE TRIGGER t_atualiza_estoque_after AFTER INSERT ON public.vendido FOR EACH ROW EXECUTE FUNCTION public.delete_defasados();
 9   DROP TRIGGER t_atualiza_estoque_after ON public.vendido;
       public          postgres    false    210    212            c           2606    25118    vendido vendido_id_produto_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.vendido
    ADD CONSTRAINT vendido_id_produto_fkey FOREIGN KEY (id_produto) REFERENCES public.estoque(cod_produto) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.vendido DROP CONSTRAINT vendido_id_produto_fkey;
       public          postgres    false    210    3170    209            ?   ?   x???A
?@ н??;?HKZIf??V&???q?E?i?9?XSg?<^^V٩????0?k'?N?F??$?A?0???@????@?|b?%-?YA??O???? ^?[/w???ݣ?s?p???W>??+5???????;~??N??u???????[?-      ?   
   x???         