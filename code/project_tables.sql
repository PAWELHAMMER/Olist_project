/* Olist Data analysis
© 2024 Portfolio
*/

-- Tables
-- Create olist_products table

drop table if exists olist_products;
create table olist_products(
product_id VARCHAR(40) NOT NULL PRIMARY KEY,
product_description_lenght INT,
product_height_cm INT,
product_length_cm INT,
product_name_lenght INT,
product_photos_qty INT,
product_weight_g INT,
product_width_cm INT
)

-- Create olist_order_items table

drop table if exists olist_order_items;
create table olist_order_items(
order_id VARCHAR(40) NOT NULL PRIMARY KEY,
order_item_id INT,
product_id VARCHAR(40) NOT NULL,
seller_id VARCHAR(40),
shipping_limit_date TIMESTAMP,
price NUMERIC(5,2),
freight_value NUMERIC(5,2)
)

-- Create olist_orders table

drop table if exists olist_orders;
create table olist_orders(
order_id VARCHAR(40) NOT NULL PRIMARY KEY,
customer_id VARCHAR(40),
order_status VARCHAR (10),
order_purchase TIMESTAMP,
order_approved_at TIMESTAMP,
order_delivered_carrier_date TIMESTAMP,
order_delivered_customer_date TIMESTAMP,
order_estimated_delivery_date TIMESTAMP
)

-- Create olist_order_payments table

drop table if exists olist_order_payments;
create table olist_order_payments(
order_id VARCHAR(40) NOT NULL PRIMARY KEY,
payment_type VARCHAR(15),
payment_value NUMERIC(5,2)
)

-- Insert Data into tables
-- olist_products table

 /* Note:This data is only part of a much larger set used to test the code. 
 Here, I used INSERT INTO to better show what type of data is in each column.
 A link to the full databases can be found in the project description. */
 
insert into olist_products (product_id, product_description_lenght, product_height_cm,product_length_cm,product_name_lenght,product_photos_qty,product_weight_g,product_width_cm )
values
('1e9e8ef04dbcff4541ed26657ea517e5',	'287',	'10',	'16',	'40',	'1',	'10',	'14'),
('3aa071139cb16b67ca9e5dea641aaa2f',	'276',	'18',	'30',	'44',	'1',	'18',	'20'),
('96bd76ec8810374ed1b65e291975717f',	'250',	'9',	'18',	'46',	'1',	'9',	'15'),
('cef67bcfe19066a932b7673e239eb23d',	'261',	'4',	'26',	'27',	'1',	'4',	'26'),
('9dc1a7de274444849c219cff195d0b71',	'402',	'17',	'20',	'37',	'4',	'17',	'13'),
('41d3672d4792049fa1779bb35283ed13',	'745',	'5',	'38',	'60',	'1',	'5',	'11'),
('732bd381ad09e530fe0a5f457d81becb',	'1272',	'24',	'70',	'56',	'4',	'24',	'44'),
('2548af3e6e77a690cf3eb6368e9ab61e',	'184',	'8',	'40',	'56',	'2',	'8',	'40'),
('37cc742be07708b53a98702e77a21a02',	'163',	'13',	'27',	'57',	'1',	'13',	'17'),
('8c92109888e8cdf9d66dc7e463025574',	'1156',	'10',	'17',	'36',	'1',	'10',	'12'),
('14aa47b7fe5c25522b47b4b29c98dcb9',	'630',	'10',	'16',	'54',	'1',	'10',	'16'),
('03b63c5fc16691530586ae020c345514',	'728',	'19',	'50',	'49',	'4',	'19',	'45'),
('cf55509ea8edaaac1d28fdb16e48fc22',	'1827',	'7',	'17',	'43',	'3',	'7',	'17'),
('7bb6f29c2be57716194f96496660c7c2',	'2083',	'11',	'68',	'51',	'2',	'11',	'13'),
('eb31436580a610f202c859463d8c7415',	'1602',	'7',	'17',	'59',	'4',	'7',	'17'),
('3bb7f144022e6732727d8d838a7b13b3',	'3021',	'2',	'16',	'22',	'1',	'2',	'11'),
('6a2fb4dd53d2cdb88e0432f1284a004c',	'346',	'5',	'27',	'39',	'2',	'5',	'20'),
('a1b71017a84f92fd8da4aeefba108a24',	'636',	'15',	'40',	'59',	'1',	'15',	'20'),
('a0736b92e52f6cead290e30b578413b6',	'296',	'7',	'100',	'56',	'2',	'7',	'15'),
('f53103a77d9cf245e579ea37e5ec51f0',	'206',	'10',	'16',	'52',	'1',	'10',	'16'),
('1c1890ba1779090cd54008a3c3302921',	'158',	'24',	'29',	'27',	'4',	'24',	'45'),
('518ef5de2c2b3a255e326a4594ba15d9',	'329',	'8',	'36',	'27',	'2',	'8',	'16'),
('e3e020af31d4d89d2602272b315c3f6e',	'1987',	'7',	'21',	'58',	'3',	'7',	'13'),
('8b41fbc2b984a12030090112324d1bc4',	'1627',	'13',	'20',	'55',	'1',	'13',	'13'),
('d03bd02af9fff4b98f1c972315e5e9ef',	'209',	'10',	'40',	'56',	'1',	'10',	'30'),
('8ba4f2a4ae695d26e5626c1bf710975e',	'968',	'5',	'50',	'52',	'1',	'5',	'50'),
('f6574524b07d5bb753bab6f35abe2d06',	'573',	'25',	'35',	'52',	'5',	'25',	'50'),
('c78b767da00efb70c1bcccab87c28cd5',	'1101',	'2',	'42',	'35',	'2',	'2',	'30'),
('a0253d43394dd4da9a5d7b1f546f1a32',	'1890',	'13',	'23',	'59',	'2',	'13',	'13')

-- olist_order_items table

insert into olist_order_items (order_id,order_item_id,product_id,seller_id,shipping_limit_date,price,freight_value)
values
('e481f51cbdc54678b7cc49136f2d6af7',	'1',	'1e9e8ef04dbcff4541ed26657ea517e5',	'48436dade18ac8b2bce089ec2a041202',	 '19.09.2017  09:45:35',	'58.90',	'13.29'),
('53cdb2fc8bc7dce0b6741e2150273451',	'1',	'3aa071139cb16b67ca9e5dea641aaa2f',	'dd7ddc04e1b6c2c614352b383efe2d36',	 '03.05.2017  11:05:13',	'239.90',	'19.93'),
('47770eb9100c2d0c44946d9cf07ec65d',	'1',	'96bd76ec8810374ed1b65e291975717f',	'5b51032eddd242adc84c38acab88f23d',	 '18.01.2018  14:48:30',	'199.00',	'17.87'),
('949d5b44dbf5de918fe9c16f97b45f8a',	'1',	'cef67bcfe19066a932b7673e239eb23d',	'9d7a1d34a5052409006425275ba1c2b4',	 '15.08.2018  10:10:18',	'12.99',	'12.79'),
('ad21c59c0840e6cb83a9ceb5573f8159',	'1',	'9dc1a7de274444849c219cff195d0b71',	'df560393f3a51e74553ab94004ba5c87',	 '13.02.2017  13:57:51',	'199.90',	'18.14'),
('a4591c265e18cb1dcee52889e2d8acc3',	'1',	'41d3672d4792049fa1779bb35283ed13',	'6426d21aca402a131fc0a5d0960a3c90',	 '23.05.2017  03:55:27',	'21.90',	'12.69'),
('136cce7faa42fdb2cefd53fdc79a6098',	'1',	'732bd381ad09e530fe0a5f457d81becb',	'7040e82f899a04d1b434b795a43b4617',	 '14.12.2017  12:10:31',	'19.90',	'11.85'),
('6514b8ad8028c9f2cc2374ded245783f',	'1',	'2548af3e6e77a690cf3eb6368e9ab61e',	'5996cddab893a4652a15592fb58ab8db',	 '10.07.2018  12:30:45',	'810.00',	'70.75'),
('76c6e866289321a7c93b82b54852dc33',	'1',	'37cc742be07708b53a98702e77a21a02',	'a416b6a846a11724393025641d4edd5e',	 '26.03.2018  18:31:29',	'145.95',	'11.65'),
('e69bfb5eb88e0ed6a785585b27e16dbf',	'1',	'8c92109888e8cdf9d66dc7e463025574',	'ba143b05f0110f0dc71ad71b4466ce92',	 '06.07.2018  14:10:56',	'53.99',	'11.40'),
('e6ce16cb79ec1d90b1da9085a6118aeb',	'1',	'14aa47b7fe5c25522b47b4b29c98dcb9',	'cc419e0650a3c5ba77189a1882b7556a',	 '29.03.2018  22:28:09',	'59.99',	'8.88'),
('34513ce0c4fab462a55830c0989c7edb',	'1',	'03b63c5fc16691530586ae020c345514',	'8602a61d680a10a82cceeeda0d99ea3d',	 '31.07.2018  17:30:39',	'45.00',	'12.98'),
('82566a660a982b15fb86e904c8d32918',	'1',	'cf55509ea8edaaac1d28fdb16e48fc22',	'4a3ca9315b744ce9f8e9374361493884',	 '26.07.2018  17:24:20',	'74.00',	'23.32'),
('5ff96c15d0b717ac6ad1f3d77225a350',	'1',	'7bb6f29c2be57716194f96496660c7c2',	'1f50f920176fa81dab994f9023523100',	 '21.02.2018  02:55:52',	'49.90',	'13.37'),
('432aaf21d85167c2c86ec9448c4e42cc',	'2',	'eb31436580a610f202c859463d8c7415',	'1f50f920176fa81dab994f9023523100',	 '21.02.2018  02:55:52',	'49.90',	'13.37'),
('dcb36b511fcac050b97cd5c05de84dc3',	'1',	'3bb7f144022e6732727d8d838a7b13b3',	'530ec6109d11eaaf87999465c6afee01',	 '17.08.2018  12:15:10',	'99.90',	'27.65'),
('403b97836b0c04a622354cf531062e5f',	'1',	'6a2fb4dd53d2cdb88e0432f1284a004c',	'fcb5ace8bcc92f75707dc0f01a27d269',	 '02.05.2018  09:31:53',	'639.00',	'11.34'),
('116f0b09343b49556bbad5f35bee0cdf',	'1',	'a1b71017a84f92fd8da4aeefba108a24',	'fe2032dab1a61af8794248c8196565c9',	 '16.05.2018  20:57:03',	'144.00',	'8.77'),
('85ce859fd6dc634de8d2f1e290444043',	'1',	'a0736b92e52f6cead290e30b578413b6',	'218d46b86c1881d022bce9c68a7d4b15',	 '21.08.2017  03:33:13',	'99.00',	'13.71'),
('83018ec114eee8641c97e08f7b4e926f',	'1',	'f53103a77d9cf245e579ea37e5ec51f0',	'8cbac7e12637ed9cffa18c7875207478',	 '28.02.2018  12:08:37',	'25.00',	'16.11'),
('203096f03d82e0dffbc41ebc2e2bcfb7',	'1',	'1c1890ba1779090cd54008a3c3302921',	'1c129092bf23f28a5930387c980c0dfc',	 '29.03.2018  20:07:49',	'47.90',	'8.88'),
('f848643eec1d69395095eb3840d2051e',	'1',	'518ef5de2c2b3a255e326a4594ba15d9',	'ea8482cd71df3c1969d7b9473ff13abc',	 '27.11.2017  19:09:02',	'21.99',	'11.85'),
('2807d0e504d6d4894d41672727bc139f',	'1',	'e3e020af31d4d89d2602272b315c3f6e',	'7c67e1448b00f6e969d365cea6b010ab',	 '21.03.2018  11:10:11',	'119.99',	'44.40'),
('95266dbfb7e20354baba07964dac78d5',	'1',	'8b41fbc2b984a12030090112324d1bc4',	'6560211a19b47992c3666cc44a7e94c0',	 '05.03.2018  09:35:41',	'49.00',	'15.10'),
('f3e7c359154d965827355f39d6b1fdac',	'1',	'd03bd02af9fff4b98f1c972315e5e9ef',	'3504c0cb71d7fa48d967e0e4c94d59d9',	 '15.09.2017  18:04:37',	'48.90',	'16.60'),
('fbf9ac61453ac646ce8ad9783d7d0af6',	'1',	'8ba4f2a4ae695d26e5626c1bf710975e',	'c864036feaab8c1659f65ea4faebe1da',	 '11.08.2017  00:35:12',	'219.90',	'16.98'),
('acce194856392f074dbf9dada14d8d82',	'1',	'f6574524b07d5bb753bab6f35abe2d06',	'bfd27a966d91cfaafdb25d076585f0da',	 '29.01.2018  21:51:25',	'289.00',	'26.33'),
('dd78f560c270f1909639c11b925620ea',	'1',	'c78b767da00efb70c1bcccab87c28cd5',	'41b39e28db005d9731d9d485a83b4c38',	 '29.03.2017  13:05:42',	'109.90',	'25.51'),
('91b2a010e1e45e6ba3d133fa997597be',	'1',	'a0253d43394dd4da9a5d7b1f546f1a32',	'16090f2ca825584b5a147ab24aa30c86',	 '14.06.2018  05:16:24',	'27.90',	'7.94')

-- insert into olist_orders table

insert into olist_orders (order_id,customer_id,order_status,order_purchase,order_approved_at,order_delivered_carrier_date,order_delivered_customer_date,order_estimated_delivery_date)
values
('e481f51cbdc54678b7cc49136f2d6af7',	'9ef432eb6251297304e76186b10a928d',	'delivered',	'02.10.2017',	'02.10.2017',	'04.10.2017',	'10.10.2017',	'18.10.2017'),
('53cdb2fc8bc7dce0b6741e2150273451',	'b0830fb4747a6c6d20dea0b8c802d7ef',	'delivered',	'24.07.2018',	'26.07.2018',	'26.07.2018',	'07.08.2018',	'13.08.2018'),
('47770eb9100c2d0c44946d9cf07ec65d',	'41ce2a54c0b03bf3443c3d931a367089',	'delivered',	'08.08.2018',	'08.08.2018',	'08.08.2018',	'17.08.2018',	'04.09.2018'),
('949d5b44dbf5de918fe9c16f97b45f8a',	'f88197465ea7920adcdbec7375364d82',	'delivered',	'18.11.2017',	'18.11.2017',	'22.11.2017',	'02.12.2017',	'15.12.2017'),
('ad21c59c0840e6cb83a9ceb5573f8159',	'8ab97904e6daea8866dbdbc4fb7aad2c',	'delivered',	'13.02.2018',	'13.02.2018',	'14.02.2018',	'16.02.2018',	'26.02.2018'),
('a4591c265e18cb1dcee52889e2d8acc3',	'503740e9ca751ccdda7ba28e9ab8f608',	'delivered',	'09.07.2017',	'09.07.2017',	'11.07.2017',	'26.07.2017',	'01.08.2017'),
('136cce7faa42fdb2cefd53fdc79a6098',	'ed0271e0b7da060a393796590e7b737a',	'invoiced',	'11.04.2017',	'13.04.2017',	NULL,	NULL,	'09.05.2017'),
('6514b8ad8028c9f2cc2374ded245783f',	'9bdf08b4b3b52b5526ff42d37d47f222',	'delivered',	'16.05.2017',	'16.05.2017',	'22.05.2017',	'26.05.2017',	'07.06.2017'),
('76c6e866289321a7c93b82b54852dc33',	'f54a9f0e6b351c431402b8461ea51999',	'delivered',	'23.01.2017',	'25.01.2017',	'26.01.2017',	'02.02.2017',	'06.03.2017'),
('e69bfb5eb88e0ed6a785585b27e16dbf',	'31ad1d1b63eb9962463f764d4e6e0c9d',	'delivered',	'29.07.2017',	'29.07.2017',	'10.08.2017',	'16.08.2017',	'23.08.2017'),
('e6ce16cb79ec1d90b1da9085a6118aeb',	'494dded5b201313c64ed7f100595b95c',	'delivered',	'16.05.2017',	'16.05.2017',	'18.05.2017',	'29.05.2017',	'07.06.2017'),
('34513ce0c4fab462a55830c0989c7edb',	'7711cf624183d843aafe81855097bc37',	'delivered',	'13.07.2017',	'13.07.2017',	'14.07.2017',	'19.07.2017',	'08.08.2017'),
('82566a660a982b15fb86e904c8d32918',	'd3e3b74c766bc6214e0c830b17ee2341',	'delivered',	'07.06.2018',	'09.06.2018',	'11.06.2018',	'19.06.2018',	'18.07.2018'),
('5ff96c15d0b717ac6ad1f3d77225a350',	'19402a48fe860416adf93348aba37740',	'delivered',	'25.07.2018',	'25.07.2018',	'26.07.2018',	'30.07.2018',	'08.08.2018'),
('432aaf21d85167c2c86ec9448c4e42cc',	'3df704f53d3f1d4818840b34ec672a9f',	 'invoiced',	'01.03.2018',	'01.03.2018',	NULL,	NULL,	'21.03.2018'),
('dcb36b511fcac050b97cd5c05de84dc3',	'3b6828a50ffe546942b7a473d70ac0fc',	'delivered',	'07.06.2018',	'12.06.2018',	'11.06.2018',	'21.06.2018',	'04.07.2018'),
('403b97836b0c04a622354cf531062e5f',	'738b086814c6fcc74b8cc583f8516ee3',	'delivered',	'02.01.2018',	'02.01.2018',	'03.01.2018',	'20.01.2018',	'06.02.2018'),
('116f0b09343b49556bbad5f35bee0cdf',	'3187789bec990987628d7a9beb4dd6ac',	'delivered',	'26.12.2017',	'26.12.2017',	'28.12.2017',	'08.01.2018',	'29.01.2018'),
('85ce859fd6dc634de8d2f1e290444043',	'059f7fc5719c7da6cbafe370971a8d70',	'delivered',	'21.11.2017',	'21.11.2017',	'23.11.2017',	'27.11.2017',	'11.12.2017'),
('83018ec114eee8641c97e08f7b4e926f',	'7f8c8b9c2ae27bf3300f670c3d478be8',	'delivered',	'26.10.2017',	'26.10.2017',	'26.10.2017',	'08.11.2017',	'23.11.2017'),
('203096f03d82e0dffbc41ebc2e2bcfb7',	'd2b091571da224a1b36412c18bc3bbfe',	'delivered',	'18.09.2017',	'19.09.2017',	'06.10.2017',	'09.10.2017',	'28.09.2017'),
('f848643eec1d69395095eb3840d2051e',	'4fa1cd166fa598be6de80fa84eaade43',	 'shipped',	'15.03.2018',	'15.03.2018',	'15.03.2018',	NULL,	'29.03.2018'),
('2807d0e504d6d4894d41672727bc139f',	'72ae281627a6102d9b3718528b420f8a',	'delivered',	'03.02.2018',	'03.02.2018',	'05.02.2018',	'08.02.2018',	'21.02.2018'),
('95266dbfb7e20354baba07964dac78d5',	'a166da34890074091a942054b36e4265',	'delivered',	'08.01.2018',	'08.01.2018',	'24.01.2018',	'26.01.2018',	'21.02.2018'),
('f3e7c359154d965827355f39d6b1fdac',	'62b423aab58096ca514ba6aa06be2f98',	'delivered',	'09.08.2018',	'10.08.2018',	'10.08.2018',	'13.08.2018',	'17.08.2018'),
('fbf9ac61453ac646ce8ad9783d7d0af6',	'3a874b4d4c4b6543206ff5d89287f0c3',	'delivered',	'20.02.2018',	'22.02.2018',	'26.02.2018',	'21.03.2018',	'12.03.2018'),
('acce194856392f074dbf9dada14d8d82',	'7e20bf5ca92da68200643bda76c504c6',	'delivered',	'04.06.2018',	'05.06.2018',	'05.06.2018',	'16.06.2018',	'18.07.2018'),
('dd78f560c270f1909639c11b925620ea',	'8b212b9525f9e74e85e37ed6df37693e',	 'shipped',	'12.03.2018',	'12.03.2018',	'12.03.2018',	NULL,	'28.03.2018'),
('91b2a010e1e45e6ba3d133fa997597be',	'cce89a605105b148387c52e286ac8335',	'delivered',	'02.05.2018',	'03.05.2018',	'10.05.2018',	'16.05.2018',	'23.05.2018')


-- insert into olist_order_payments table 

insert into olist_order_payments (order_id,payment_type,payment_value)
values
('e481f51cbdc54678b7cc49136f2d6af7',	'credit_card',	'99.33'),
('53cdb2fc8bc7dce0b6741e2150273451',	'credit_card',	'24.39'),
('47770eb9100c2d0c44946d9cf07ec65d',	'credit_card',	'65.71'),
('949d5b44dbf5de918fe9c16f97b45f8a',	'credit_card',	'107.78'),
('ad21c59c0840e6cb83a9ceb5573f8159',	'credit_card',	'128.45'),
('a4591c265e18cb1dcee52889e2d8acc3',	'credit_card',	'96.12'),
('136cce7faa42fdb2cefd53fdc79a6098',	'credit_card',	'81.16'),
('6514b8ad8028c9f2cc2374ded245783f',	'credit_card',	'51.84'),
('76c6e866289321a7c93b82b54852dc33',	'credit_card',	'341.09'),
('e69bfb5eb88e0ed6a785585b27e16dbf',	'boleto',	'51.95'),
('e6ce16cb79ec1d90b1da9085a6118aeb',	'credit_card',	'188.73'),
('34513ce0c4fab462a55830c0989c7edb',	'credit_card',	'141.90'),
('82566a660a982b15fb86e904c8d32918',	'credit_card',	'75.78'),
('5ff96c15d0b717ac6ad1f3d77225a350',	'credit_card',	'102.66'),
('432aaf21d85167c2c86ec9448c4e42cc',	'credit_card',	'105.28'),
('dcb36b511fcac050b97cd5c05de84dc3',	'credit_card',	'157.45'),
('403b97836b0c04a622354cf531062e5f',	'credit_card',	'132.04'),
('116f0b09343b49556bbad5f35bee0cdf',	'credit_card',	'98.94'),
('85ce859fd6dc634de8d2f1e290444043',	'credit_card',	'244.15'),
('83018ec114eee8641c97e08f7b4e926f',	'credit_card',	'136.71'),
('203096f03d82e0dffbc41ebc2e2bcfb7',	'credit_card',	'47.69'),
('f848643eec1d69395095eb3840d2051e',	'credit_card',	'170.57'),
('2807d0e504d6d4894d41672727bc139f',	'credit_card',	'67.50'),
('95266dbfb7e20354baba07964dac78d5',	'credit_card',	'353.09'),
('f3e7c359154d965827355f39d6b1fdac',	'boleto',	'330.66'),
('fbf9ac61453ac646ce8ad9783d7d0af6',	'voucher',	'45.17'),
('acce194856392f074dbf9dada14d8d82',	'credit_card',	'541.00'),
('dd78f560c270f1909639c11b925620ea',	'credit_card',	'139.22'),
('91b2a010e1e45e6ba3d133fa997597be',	'credit_card',	'290.16')

-- END
