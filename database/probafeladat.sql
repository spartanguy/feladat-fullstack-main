/*
 Navicat Premium Data Transfer

 Source Server         : interju - fullstack
 Source Server Type    : PostgreSQL
 Source Server Version : 170002 (170002)
 Source Host           : 127.0.0.1:8432
 Source Catalog        : probafeladat
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 170002 (170002)
 File Encoding         : 65001

 Date: 03/02/2025 16:33:35
*/


-- ----------------------------
-- Sequence structure for user_permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_permissions_id_seq";
CREATE SEQUENCE "public"."user_permissions_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_id_seq";
CREATE SEQUENCE "public"."users_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."permissions";
CREATE TABLE "public"."permissions" (
  "id" int8 NOT NULL,
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" int8
)
;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO "public"."permissions" VALUES (1001, 'Felhasználók olvasása', 'user.read', 1000);
INSERT INTO "public"."permissions" VALUES (1002, 'Felhasználók írása', 'user.write', 1000);
INSERT INTO "public"."permissions" VALUES (1, 'Minden jog', 'root', NULL);
INSERT INTO "public"."permissions" VALUES (1000, 'Felhasználók', 'user', 1);

-- ----------------------------
-- Table structure for user_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_permissions";
CREATE TABLE "public"."user_permissions" (
  "id" int8 NOT NULL DEFAULT nextval('user_permissions_id_seq'::regclass),
  "user_id" int8 NOT NULL,
  "permission_id" int8 NOT NULL
)
;

-- ----------------------------
-- Records of user_permissions
-- ----------------------------
INSERT INTO "public"."user_permissions" VALUES (1, 1, 1000);
INSERT INTO "public"."user_permissions" VALUES (2, 1, 1001);
INSERT INTO "public"."user_permissions" VALUES (3, 1, 1002);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "id" int8 NOT NULL DEFAULT nextval('users_id_seq'::regclass),
  "name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "email" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "deleted" bool NOT NULL DEFAULT false
)
;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES (1, 'Admin', 'admin@admin.hu', '$argon2i$v=19$m=65536,t=4,p=1$eXhLMFRWQVVOMG92T1VtZA$TO3V3vRA0OHsoifdpTT5ldjrdhszsdF462UxJc9GlgE', 'f');
INSERT INTO "public"."users" VALUES (2, 'Joshua Brown', 'brownjoshu@gmail.com', '3531138261f9b808d3aae83aad499a80', 't');
INSERT INTO "public"."users" VALUES (3, 'Ray Garcia', 'raygar@gmail.com', '19985425045a102b3f2774121aed302a', 't');
INSERT INTO "public"."users" VALUES (4, 'Anna Harris', 'harrisanna7@hotmail.com', 'dd16e29a89c257b16667496eab95e5c6', 'f');
INSERT INTO "public"."users" VALUES (5, 'Lois Murray', 'mulois@gmail.com', '3b3adb2493f52bcd0f601859330bc4c1', 'f');
INSERT INTO "public"."users" VALUES (6, 'Danielle Ramirez', 'danielleram8@icloud.com', '0b45177e607337bd85776186a3335f11', 'f');
INSERT INTO "public"."users" VALUES (7, 'Joan Fisher', 'fishj@gmail.com', 'cfcf6d89761957f59ae2fcba0c254709', 't');
INSERT INTO "public"."users" VALUES (8, 'Jean Ellis', 'ellisjean@outlook.com', 'ed0ce2bf592c964d263a53ab3232f700', 't');
INSERT INTO "public"."users" VALUES (9, 'Danielle Reynolds', 'danielle4@icloud.com', '2dae281309e2ba7eec398a1d440f5f1c', 'f');
INSERT INTO "public"."users" VALUES (10, 'Danielle Holmes', 'daniellehol@outlook.com', '5f6f1bc6c3e0d2e88a1ce370366e6789', 't');
INSERT INTO "public"."users" VALUES (11, 'Julie Harris', 'harj@outlook.com', 'fa4d86625924e2f7e8d3b0f5ed274a86', 'f');
INSERT INTO "public"."users" VALUES (12, 'Clara Garza', 'garzaclara@hotmail.com', 'b142df59a8ac63f68f251e197a6414f0', 't');
INSERT INTO "public"."users" VALUES (13, 'Bryan White', 'bryanwhit@gmail.com', '736e2c21c509026b2be466021f171519', 'f');
INSERT INTO "public"."users" VALUES (14, 'Scott Harrison', 'harrsco@icloud.com', 'a8f0608776d610c27b72e22791100c34', 'f');
INSERT INTO "public"."users" VALUES (15, 'Sarah Cook', 'cook70@gmail.com', '0910817155a98a87a41c4b06d140e03d', 't');
INSERT INTO "public"."users" VALUES (16, 'Albert Black', 'albert3@hotmail.com', '3cd7bca849c7d06988dca8708fdb9f8f', 't');
INSERT INTO "public"."users" VALUES (17, 'Jonathan Brooks', 'jonatbrooks@hotmail.com', '811d62679c3fb349c87754b4a5235f93', 't');
INSERT INTO "public"."users" VALUES (18, 'Daniel Garza', 'dagarza@outlook.com', '2e3cbc58591a2eb7424bea2f4d1b0279', 't');
INSERT INTO "public"."users" VALUES (19, 'Roger Soto', 'rso602@gmail.com', '135f6978beac480ac2a597272cc3f8e8', 'f');
INSERT INTO "public"."users" VALUES (20, 'Paula Campbell', 'campbell10@outlook.com', 'b3c6b89c3296ad35d0f175a2c8a9c6c4', 'f');
INSERT INTO "public"."users" VALUES (21, 'Jamie Thomas', 'thomjamie2@gmail.com', '7e82d119640fadf4ef7dc9e960f5bd83', 'f');
INSERT INTO "public"."users" VALUES (22, 'Maria Herrera', 'herrera817@outlook.com', '1104ec5205a1c6e4cf3bc55cdd2f80b2', 't');
INSERT INTO "public"."users" VALUES (23, 'Alfred Allen', 'allealfr7@mail.com', '34760037b798d5503a4c88250e4c263f', 'f');
INSERT INTO "public"."users" VALUES (24, 'Margaret Martinez', 'martinez3@gmail.com', 'f643032952ee6df79f696e5bfe344630', 't');
INSERT INTO "public"."users" VALUES (25, 'Frances Alvarez', 'fa618@icloud.com', 'd07b7b6bca565047e4b679b5bd9f306f', 't');
INSERT INTO "public"."users" VALUES (26, 'Victor Alvarez', 'alvavict8@gmail.com', '1851060ba76cb1be273156e8948a31f3', 't');
INSERT INTO "public"."users" VALUES (27, 'George Soto', 'sotogeorge@hotmail.com', '352cc7d1fbeb346a3b7173cf25f9a52b', 'f');
INSERT INTO "public"."users" VALUES (28, 'George Gonzalez', 'georgegonzalez7@icloud.com', 'bc0152255441a9f9c3ee65c04a7a9d3b', 't');
INSERT INTO "public"."users" VALUES (29, 'Tammy Burns', 'burnsta1949@hotmail.com', 'd1ced247806e512bf360b4e0a2a31a20', 'f');
INSERT INTO "public"."users" VALUES (30, 'Martin Adams', 'martin10@gmail.com', '6bb05b13b010af79c41ed9171bad9e78', 't');
INSERT INTO "public"."users" VALUES (31, 'Henry Sanchez', 'sanchez817@outlook.com', '4b42b184cb675c113b36f8f6d53fd424', 't');
INSERT INTO "public"."users" VALUES (32, 'Roger Vargas', 'vargaroger80@gmail.com', 'c2935df20cfed8353f3fd543022b9bf4', 't');
INSERT INTO "public"."users" VALUES (33, 'Steve Robinson', 'rst@gmail.com', 'e1ebb49019f188424c23bf71817670bd', 'f');
INSERT INTO "public"."users" VALUES (34, 'Fred Grant', 'fred727@outlook.com', 'e4a60789c8cb26bcf3a9de04ec5f13aa', 'f');
INSERT INTO "public"."users" VALUES (35, 'Barbara Daniels', 'danielsb@icloud.com', '471ef2f4c0e997cad153730db5edabc4', 'f');
INSERT INTO "public"."users" VALUES (36, 'Beverly Evans', 'eb6@outlook.com', '1d930d232cbbc126d94dd326bc94e2f0', 't');
INSERT INTO "public"."users" VALUES (37, 'Keith Spencer', 'ksp@yahoo.com', '0d95d6b4e4943225a4338a493601a166', 'f');
INSERT INTO "public"."users" VALUES (38, 'Micheal Gray', 'migra@gmail.com', '7c16f11da2ee8055a3b6713c1a6b5cec', 'f');
INSERT INTO "public"."users" VALUES (39, 'Kyle Silva', 'kyle116@mail.com', 'f48da1ce4e18d2fb68375bb5f10cf070', 't');
INSERT INTO "public"."users" VALUES (40, 'Tiffany Stone', 'stoti4@gmail.com', '00779ec2eafe8c344c75d922e340a89b', 't');
INSERT INTO "public"."users" VALUES (41, 'Dennis Hernandez', 'hernandezdennis1@icloud.com', '6cdb5b097adf22ac88dc2d945f42e0dc', 'f');
INSERT INTO "public"."users" VALUES (42, 'Cheryl Watson', 'cherw@outlook.com', '4a908cb8f75a26314aa71fba9da6d69b', 't');
INSERT INTO "public"."users" VALUES (43, 'Curtis Mason', 'mascurti@mail.com', '2e03b2396dbcedfffbd44f662629cdcc', 'f');
INSERT INTO "public"."users" VALUES (44, 'Earl Ward', 'earlwar318@outlook.com', 'fedbf8e16bf1ee4e65ac13e8386f718c', 'f');
INSERT INTO "public"."users" VALUES (45, 'Joel Gonzalez', 'gonjoel@gmail.com', '692624fa7eb03b341defac2c6a6f23eb', 't');
INSERT INTO "public"."users" VALUES (46, 'Nancy Patel', 'npatel@hotmail.com', 'dda808e184da87c262b17e4105a21429', 't');
INSERT INTO "public"."users" VALUES (47, 'Amanda Wood', 'woodam1107@icloud.com', '10c740f3f2c821f559d2a32f77522dfd', 't');
INSERT INTO "public"."users" VALUES (48, 'Victoria Wallace', 'wallacevictoria4@mail.com', 'c41b9cab6417563c99d436e40f6030d5', 'f');
INSERT INTO "public"."users" VALUES (49, 'Robin Gordon', 'gorrobin6@yahoo.com', 'bf5211c5c7f0105dde47ff6c388a1ac8', 't');
INSERT INTO "public"."users" VALUES (50, 'Jerry Gonzalez', 'jerrgonzalez@gmail.com', '6db15dfc02c7d5b981ac5678ee6af043', 't');
INSERT INTO "public"."users" VALUES (51, 'Fred Mason', 'fredm@gmail.com', '6acaa697aecea0d9d3e41b1de0bec57c', 't');
INSERT INTO "public"."users" VALUES (52, 'Mario Mendez', 'mariomendez@hotmail.com', '3f901377ba46d6936d1c7cb63577dd05', 'f');
INSERT INTO "public"."users" VALUES (53, 'Patricia Hall', 'pahall@gmail.com', 'a3a9a8ca299c7a8c49b8db88dbaa9351', 't');
INSERT INTO "public"."users" VALUES (54, 'Jose Phillips', 'josephillips8@icloud.com', '26d13e5690a5a129be48fc4d9b85c692', 'f');
INSERT INTO "public"."users" VALUES (55, 'Bruce Stone', 'stonebr@yahoo.com', '8b06c82ce6b5f6ec3d907f316db98d08', 'f');
INSERT INTO "public"."users" VALUES (56, 'Arthur Carter', 'arthur4@yahoo.com', 'd5aec9c115160127e2586ccba6c9a96d', 't');
INSERT INTO "public"."users" VALUES (57, 'Theodore West', 'theodore9@gmail.com', '29776d65a74906b4f86012faec5af99c', 't');
INSERT INTO "public"."users" VALUES (58, 'Linda White', 'lindawhite@mail.com', '55fb6723a7d8d65b3d94d4357e416efc', 't');
INSERT INTO "public"."users" VALUES (59, 'Jean Kelly', 'kelly5@outlook.com', '10de31d6ce8050b7f9d1cf357e049771', 'f');
INSERT INTO "public"."users" VALUES (60, 'Daniel Diaz', 'ddaniel1950@outlook.com', 'd6e12b0afa54abc1b22b4ebde4952b26', 'f');
INSERT INTO "public"."users" VALUES (61, 'Lillian Miller', 'millilli@yahoo.com', 'b3816af54f869192862411f2d2e602e7', 'f');
INSERT INTO "public"."users" VALUES (62, 'Frederick Sanchez', 'frederick71@gmail.com', '6f04df2553a80aad66660382541475ef', 'f');
INSERT INTO "public"."users" VALUES (63, 'Emma Adams', 'ademma@gmail.com', 'f1054ee1ff833889b2f5b7a5b83353f1', 't');
INSERT INTO "public"."users" VALUES (64, 'Teresa Bryant', 'bryanteresa1@gmail.com', '1dcabd5f5f2fa2fad00f632c9427f0c4', 'f');
INSERT INTO "public"."users" VALUES (65, 'Anna Phillips', 'phann424@gmail.com', '998dd767eb406196167b3f44aea7f816', 'f');
INSERT INTO "public"."users" VALUES (66, 'Edward Sullivan', 'sed@yahoo.com', '9f9cc9da280b4d05ee434a3b65130487', 'f');
INSERT INTO "public"."users" VALUES (67, 'Melvin Rogers', 'rogermelvin@icloud.com', '777a234a5262c5f4b4c9dfb4985dbe15', 't');
INSERT INTO "public"."users" VALUES (68, 'Jean Russell', 'jean309@icloud.com', '734c5e61c134811e1a48ed2cf8a37213', 't');
INSERT INTO "public"."users" VALUES (69, 'Kevin Fernandez', 'fernandezkevin@gmail.com', '188e86949d98b06a47740f8364ef9a5c', 'f');
INSERT INTO "public"."users" VALUES (70, 'Rodney Flores', 'rodneflores@hotmail.com', '1caab96ebad6c34daeca710ad5bcc5b1', 'f');
INSERT INTO "public"."users" VALUES (71, 'Mark Thomas', 'tmark06@icloud.com', '1e16ad63380e2f532a95a6ff30ceb2eb', 'f');
INSERT INTO "public"."users" VALUES (72, 'Katherine Robinson', 'rk7@gmail.com', '95956c01293014a79dff9153710f9109', 'f');
INSERT INTO "public"."users" VALUES (73, 'Ray West', 'west2@mail.com', 'efc1d17aa0e5341c4cb23406e1f80623', 'f');
INSERT INTO "public"."users" VALUES (74, 'Edna Richardson', 'ednarich1987@icloud.com', '79c08fcff96436a10942d59db590d79a', 'f');
INSERT INTO "public"."users" VALUES (75, 'Frank Baker', 'bakerf@icloud.com', 'b5643914522df74943e658b1947f087f', 'f');
INSERT INTO "public"."users" VALUES (76, 'Bonnie Stewart', 'sbonnie58@mail.com', '504d8bf8f895e9724546cc59388c64b6', 'f');
INSERT INTO "public"."users" VALUES (77, 'Sharon Howard', 'sharon4@gmail.com', 'be8030884014ff046c4831a33f5c6a93', 't');
INSERT INTO "public"."users" VALUES (78, 'Janet Ward', 'ward9@gmail.com', '418d4da1a3da02350a0828577a483807', 't');
INSERT INTO "public"."users" VALUES (79, 'Annie Gonzales', 'anniegonzales10@outlook.com', 'e063b12fb4b10eb7a7b325b43135de5e', 'f');
INSERT INTO "public"."users" VALUES (80, 'Howard Fisher', 'fisherhoward@outlook.com', 'f3f6cacab6bb9569ca3574384993cdbd', 't');
INSERT INTO "public"."users" VALUES (81, 'Ernest Martin', 'martinernest@mail.com', '9420b95e31a162e501d3f9dd6b0d06b1', 'f');
INSERT INTO "public"."users" VALUES (82, 'Emma Walker', 'wemma1120@gmail.com', '66c1980f43f8ff3a62d856c6fa1877ca', 't');
INSERT INTO "public"."users" VALUES (83, 'Bernard Alvarez', 'bernalvarez@icloud.com', 'e5eec14064e94a73ca38b413d6c94a96', 'f');
INSERT INTO "public"."users" VALUES (84, 'Kimberly Reed', 'kimbre@yahoo.com', 'aa14cb2dc21b45ce8c5fd03c66e3fe88', 't');
INSERT INTO "public"."users" VALUES (85, 'Eva Adams', 'evaadams@outlook.com', '05731b531ad0e2b3166b215f2931cc17', 't');
INSERT INTO "public"."users" VALUES (86, 'Todd Thomas', 'thomatodd1115@icloud.com', 'c519a5bc7856f72af3068f6fe3d8b7ec', 'f');
INSERT INTO "public"."users" VALUES (87, 'Joshua Morales', 'moraljosh@outlook.com', 'a169481eac91f5c8fb57606215862e9c', 'f');
INSERT INTO "public"."users" VALUES (88, 'Janet Mendez', 'janetm@hotmail.com', 'b9472f19ae407e41debf697ad0e24549', 't');
INSERT INTO "public"."users" VALUES (89, 'Doris Black', 'blackdor6@yahoo.com', '572c218d54472184f4ca4bb9dc413029', 't');
INSERT INTO "public"."users" VALUES (90, 'Emma Henderson', 'henderson12@icloud.com', '3a388bf6d85d8621f8b7451754af4efa', 'f');
INSERT INTO "public"."users" VALUES (91, 'Melvin Ryan', 'ryanm@hotmail.com', '2c34549035ad5bb4bdbb871fc5ef161d', 't');
INSERT INTO "public"."users" VALUES (92, 'Emily Ward', 'ward14@icloud.com', 'b52d4f1d7f379c9ae719bfb31dcbb22a', 't');
INSERT INTO "public"."users" VALUES (93, 'Shannon Rodriguez', 'shannon722@gmail.com', 'b3bc4b1024453c5c13707f04296a0a91', 't');
INSERT INTO "public"."users" VALUES (94, 'Walter Mcdonald', 'walmcdonald@icloud.com', 'e108db02061c4d8bfa522d0203b57aba', 't');
INSERT INTO "public"."users" VALUES (95, 'Bradley Chen', 'chen9@yahoo.com', '2b0be3e49ec39d3865a01725a56cf540', 'f');
INSERT INTO "public"."users" VALUES (96, 'Juanita Green', 'grjuanita@gmail.com', '18155c1c012a4a1128b742143f664593', 'f');
INSERT INTO "public"."users" VALUES (97, 'Joseph Campbell', 'campbelljoseph@icloud.com', '912ebc7a9751a45b65932da34c11a8b2', 'f');
INSERT INTO "public"."users" VALUES (98, 'Steve West', 'stevwest5@mail.com', '5bfca22f152f01ff950d882b3de4eda2', 'f');
INSERT INTO "public"."users" VALUES (99, 'Patricia Morales', 'patricia923@hotmail.com', '5e0aa41b0bdbb411467487447290a0cb', 't');
INSERT INTO "public"."users" VALUES (100, 'Brandon Dunn', 'dunbrandon@yahoo.com', 'd50bc38ade4d4c0e351a7cc196ab5471', 't');
INSERT INTO "public"."users" VALUES (101, 'Jimmy Ryan', 'ryanjimm53@outlook.com', '9617635f794a689053dbf9f8ac2bfb37', 't');
INSERT INTO "public"."users" VALUES (102, 'Craig Lopez', 'lopez927@hotmail.com', 'c1ce32f692930714624c8f210f575d29', 'f');
INSERT INTO "public"."users" VALUES (103, 'Janice Reed', 'reed1988@outlook.com', '5191a1a2e9b5aabf8b07076a59ecd938', 't');
INSERT INTO "public"."users" VALUES (104, 'Virginia Cruz', 'virginia2003@yahoo.com', 'ded28762ac2b32362f549d914a5ac3fd', 'f');
INSERT INTO "public"."users" VALUES (105, 'Bonnie Gonzalez', 'bonnieg7@gmail.com', '2e47ec34370105c2dcc78f4f1f4b0de6', 'f');
INSERT INTO "public"."users" VALUES (106, 'Ronald Snyder', 'snyderonald8@icloud.com', '66eeceb500c44990554d17a5f92a2019', 't');
INSERT INTO "public"."users" VALUES (107, 'Janice Ryan', 'rjan80@hotmail.com', 'bf5f5f7366ef6260711efb0e95ed5bf1', 't');
INSERT INTO "public"."users" VALUES (108, 'William Moreno', 'moreno00@outlook.com', 'a0015f1c69505ea7a59b6ececdc24375', 'f');
INSERT INTO "public"."users" VALUES (109, 'Joel Munoz', 'joel523@gmail.com', '407904ebce5609e17e11d47017c796cf', 't');
INSERT INTO "public"."users" VALUES (110, 'Mike Hernandez', 'mhern910@gmail.com', '0a717bbc2d2a9e113906a4ab98ac85cd', 't');
INSERT INTO "public"."users" VALUES (111, 'Theodore Taylor', 'theodoret@gmail.com', '5fe5dcca43b9c9bcaa051a9f2fd3e9dc', 't');
INSERT INTO "public"."users" VALUES (112, 'Christine Mcdonald', 'christine5@yahoo.com', '585d3a1bfd0bacf54b12b3296bdd85bc', 't');
INSERT INTO "public"."users" VALUES (113, 'Miguel Alexander', 'miguealexa2@outlook.com', '6a5b0103ea6b89765d6a506d383a0085', 'f');
INSERT INTO "public"."users" VALUES (114, 'Clarence Chavez', 'clchavez90@icloud.com', '317d1d2595c09c879666e2ac2dc5ffbe', 'f');
INSERT INTO "public"."users" VALUES (115, 'Grace Campbell', 'campbellgrac@gmail.com', '8cc47f593c45946b34a623c48b5b98b5', 'f');
INSERT INTO "public"."users" VALUES (116, 'Dawn Alexander', 'dawnalexander@yahoo.com', '13525fdb5e319f9598b35a8c482ec13e', 'f');
INSERT INTO "public"."users" VALUES (117, 'Scott Watson', 'scottwatson@outlook.com', '971b3d87a1e65da6f567772dbe088051', 'f');
INSERT INTO "public"."users" VALUES (118, 'Jamie Simpson', 'jamies2@hotmail.com', '5c0f5ccd1780150138ee4109e1ee2d24', 't');
INSERT INTO "public"."users" VALUES (119, 'Cynthia Ward', 'cyw@outlook.com', 'e9f9e2b0f39988c4f5d0ec163e6e6ee1', 'f');
INSERT INTO "public"."users" VALUES (120, 'Allen Nichols', 'nichoallen@gmail.com', '18a3c117563ea23a2f5e7a9a4d1eaaa7', 'f');
INSERT INTO "public"."users" VALUES (121, 'Pamela Rivera', 'pamelri@gmail.com', '3f51c39bbf579c920e7a68f2313d7906', 'f');
INSERT INTO "public"."users" VALUES (122, 'Michelle Mills', 'micmills@gmail.com', 'e51aa7749dc8a87ad0b24f29ecdbbb61', 't');
INSERT INTO "public"."users" VALUES (123, 'Nancy Lee', 'leena802@gmail.com', '4e84ba649bea292205525ee284ae62a8', 't');
INSERT INTO "public"."users" VALUES (124, 'Lucille Gordon', 'lucilg7@outlook.com', '53d356e89cebc9f7c6649e90b32d08dd', 't');
INSERT INTO "public"."users" VALUES (125, 'Paul Woods', 'paulw@outlook.com', '6ebee41de05926d2f0a40accd93943ed', 't');
INSERT INTO "public"."users" VALUES (126, 'Jean Myers', 'myerjea514@gmail.com', '1392a333db076a9cd31166943e438031', 't');
INSERT INTO "public"."users" VALUES (127, 'Kenneth Daniels', 'danielskenne@mail.com', 'c1a229d7c3069baa70d19dd882d25189', 'f');
INSERT INTO "public"."users" VALUES (128, 'Vincent Harrison', 'vincentharrison314@icloud.com', '8b0115bc8cdda8a18474825062a7843e', 't');
INSERT INTO "public"."users" VALUES (129, 'Evelyn Cruz', 'evelync517@outlook.com', 'e1be2544b0ef28bf2ac46690100747ec', 't');
INSERT INTO "public"."users" VALUES (130, 'Eric Smith', 'smitheric625@icloud.com', 'd2a2f574b183a6256cead25d256011f1', 'f');
INSERT INTO "public"."users" VALUES (131, 'Robert Hicks', 'robhicks6@gmail.com', '4c9164f38ebf5145b6a9de9e88f395d7', 'f');
INSERT INTO "public"."users" VALUES (132, 'Deborah Allen', 'allendebor@icloud.com', '0aedefd610075dcda78f9d0ab78bbd35', 't');
INSERT INTO "public"."users" VALUES (133, 'Rebecca Jones', 'jrebecca@icloud.com', '9cdbe6e899dade74af83d3b84ae21cad', 'f');
INSERT INTO "public"."users" VALUES (134, 'Marilyn Murray', 'murraymarilyn@yahoo.com', '0c2ef26400eb5ff366e3a95a6d06ba8e', 't');
INSERT INTO "public"."users" VALUES (135, 'Sheila Torres', 'torressheila@yahoo.com', '4e3ecd1f9ef3794da5081a858c7e872f', 't');
INSERT INTO "public"."users" VALUES (136, 'Jacqueline Hicks', 'jacquelinehick@yahoo.com', 'fffd4a969b97a564f7297eb85a19caba', 't');
INSERT INTO "public"."users" VALUES (137, 'Denise Clark', 'denisec92@yahoo.com', 'ced619614fdd4059eda8876e0cc7900d', 'f');
INSERT INTO "public"."users" VALUES (138, 'Billy Stephens', 'sb1218@icloud.com', '0a72eb0014bd05f9f0209f7df3d97388', 'f');
INSERT INTO "public"."users" VALUES (139, 'Randall Young', 'young1954@gmail.com', 'd49ca504777ec7efda543bd9f95817f0', 'f');
INSERT INTO "public"."users" VALUES (140, 'Jerry Murray', 'jmurray@icloud.com', '49d84f875a1a0f848b26f0d4c973a528', 'f');
INSERT INTO "public"."users" VALUES (141, 'Kathryn Lee', 'lek@yahoo.com', '5c9482cc498304ae890f2849dfbfc55a', 'f');
INSERT INTO "public"."users" VALUES (142, 'Herbert Green', 'greeher101@gmail.com', 'f5bbd2f8c90a7ad5dfd5ddeae29959a4', 't');
INSERT INTO "public"."users" VALUES (143, 'Christina Black', 'blackchri@outlook.com', '59430d711087f4d279de5a5e2356414d', 'f');
INSERT INTO "public"."users" VALUES (144, 'Allen Reyes', 'allenre@outlook.com', '6fab429b43a94af432f3de32c0cd8ec4', 't');
INSERT INTO "public"."users" VALUES (145, 'Robert Myers', 'myersrobe@icloud.com', 'b987c48fded530dc06ede3fc811a7339', 'f');
INSERT INTO "public"."users" VALUES (146, 'Wayne Cook', 'cwayne@yahoo.com', 'bcdfac779e672dce81b03de3a572e4b2', 'f');
INSERT INTO "public"."users" VALUES (147, 'Leslie Cox', 'cox9@icloud.com', '2de2292824a96accd70cc16b8c4a4904', 't');
INSERT INTO "public"."users" VALUES (148, 'Scott Kennedy', 'scott3@icloud.com', 'f2883e0d504c375a165e63455bd9d08a', 'f');
INSERT INTO "public"."users" VALUES (149, 'Shirley Ramos', 'ramshi@outlook.com', '0e41b57c3009ce387441fb695134009f', 't');
INSERT INTO "public"."users" VALUES (150, 'Donna Mendoza', 'mendozado@outlook.com', 'ffb6493eb5da60cb7bc2930ca6db6469', 'f');
INSERT INTO "public"."users" VALUES (151, 'Richard Jones', 'richajones128@yahoo.com', 'b8e0e6a90a93a34d5fc695ff481bfcf0', 'f');
INSERT INTO "public"."users" VALUES (152, 'Jerry Collins', 'jeco43@icloud.com', '348d2ae3768d5667d487e1205ab8bd61', 'f');
INSERT INTO "public"."users" VALUES (153, 'Sheila Parker', 'sheilapa@gmail.com', '7a0cd7c0b4d27e941603811f43d01775', 't');
INSERT INTO "public"."users" VALUES (154, 'Ruth Mcdonald', 'mcdruth@gmail.com', '394d40d9ea8f51b4f26d58b080036177', 't');
INSERT INTO "public"."users" VALUES (155, 'Kevin Coleman', 'colemankevin@outlook.com', '7bdbd21b2ec7cbc84f844855cb2eedce', 't');
INSERT INTO "public"."users" VALUES (156, 'Edwin Olson', 'olson7@icloud.com', 'f6d72a2187bc009dc96fc791130310eb', 't');
INSERT INTO "public"."users" VALUES (157, 'Ray Crawford', 'crawfordra@icloud.com', '56ac80cae35ac4da05e4788fe87b7c5f', 'f');
INSERT INTO "public"."users" VALUES (158, 'Rodney Mcdonald', 'mcrodney@outlook.com', 'c19c187b95be439c0b21bef2fc71d1ce', 't');
INSERT INTO "public"."users" VALUES (159, 'Danielle Stewart', 'sdanielle@outlook.com', '16aeec692c010f7b5b819ef74a8de1fd', 'f');
INSERT INTO "public"."users" VALUES (160, 'Sharon Aguilar', 'sharonaguilar@gmail.com', '43645a3cef07d01e6abdaf4e064d8c50', 't');
INSERT INTO "public"."users" VALUES (161, 'Thomas Henry', 'hth1978@outlook.com', 'cf6b4dd0a96b29ab709cffa3d92180e3', 'f');
INSERT INTO "public"."users" VALUES (162, 'Timothy Henderson', 'hendetimo9@mail.com', '1ef413c5d7ea8764321c975c9da7944f', 'f');
INSERT INTO "public"."users" VALUES (163, 'Mark Bailey', 'mbaile@gmail.com', 'ce644d2cb9f300c1d773a62e4e7123b6', 't');
INSERT INTO "public"."users" VALUES (164, 'Adam Nelson', 'nela@gmail.com', '2cfbc3b193bf542df871fe9df2db4fc4', 't');
INSERT INTO "public"."users" VALUES (165, 'Janice Nichols', 'nicjanice@gmail.com', 'f325c19960af5c3352b8288b41c10919', 'f');
INSERT INTO "public"."users" VALUES (166, 'Eric Robertson', 'robertsoner@mail.com', '148a52e4bc185b1b59060db41ea3acd4', 't');
INSERT INTO "public"."users" VALUES (167, 'Ricky Olson', 'ricky2014@hotmail.com', '4991c4de57b6e26316acb9555e86a7f8', 'f');
INSERT INTO "public"."users" VALUES (168, 'George Dixon', 'digeorge@icloud.com', 'aa898baee7d2ceb474b3dbe5f3119169', 'f');
INSERT INTO "public"."users" VALUES (169, 'Louis Holmes', 'holmes1976@icloud.com', '7dbc73a2d71278edbf80bf27f7f0d415', 'f');
INSERT INTO "public"."users" VALUES (170, 'Marilyn Foster', 'fostmar406@gmail.com', 'b27be5a215ab2a2e4a6272acb979e47f', 't');
INSERT INTO "public"."users" VALUES (171, 'Lisa Freeman', 'lisfreeman@gmail.com', '2d4d40bb4c033670fbe290adcaced703', 'f');
INSERT INTO "public"."users" VALUES (172, 'Esther Kim', 'ekim@mail.com', 'fcd6388fb949bd17122e32754f456cdd', 'f');
INSERT INTO "public"."users" VALUES (173, 'Justin Wallace', 'justinwallace@yahoo.com', '65262122fa5aee14dbe9b0a9b8ed8bf3', 't');
INSERT INTO "public"."users" VALUES (174, 'Norma Perez', 'normaperez607@icloud.com', '5e629180b2176b1b9e101ecbe159f44a', 'f');
INSERT INTO "public"."users" VALUES (175, 'Terry Wilson', 'wilson1103@gmail.com', '77e0ffc8ae9c51d6f81fa6433220553a', 'f');
INSERT INTO "public"."users" VALUES (176, 'Jesus Dixon', 'dixon2@gmail.com', '0e4a49b51246b07a1bd18e34621fd113', 't');
INSERT INTO "public"."users" VALUES (177, 'Cynthia Brown', 'cbrown417@yahoo.com', 'cddae229ccdb79ae251ec970e71a2fb3', 't');
INSERT INTO "public"."users" VALUES (178, 'Evelyn Aguilar', 'aguilarev1231@hotmail.com', '3a87bd7899e660933fc6cf93874e620d', 'f');
INSERT INTO "public"."users" VALUES (179, 'Heather Gutierrez', 'heatgutierrez@mail.com', 'ec1899ebb35d1732f1c030a0c982b610', 't');
INSERT INTO "public"."users" VALUES (180, 'Wayne Fernandez', 'wfe@icloud.com', '598b29a00250be457b4e8b24401f92ba', 't');
INSERT INTO "public"."users" VALUES (181, 'Stephen Cook', 'stephenco@icloud.com', '3dd9d5c84c36cc8da2a4b4717278e713', 't');
INSERT INTO "public"."users" VALUES (182, 'Elaine Morgan', 'moela@icloud.com', 'da4e1a649817a8e07bbe170e03079481', 't');
INSERT INTO "public"."users" VALUES (183, 'Eleanor Perry', 'pereleanor5@gmail.com', '48ae2de6ab36d55117e90225f9695020', 't');
INSERT INTO "public"."users" VALUES (184, 'Kathleen Nichols', 'nicholskat@outlook.com', '05956e89e1888e32c5d2ee67a8858372', 't');
INSERT INTO "public"."users" VALUES (185, 'Ronald Jordan', 'joronald@icloud.com', '3c492ccecb9f9e1379eaaab2c828e462', 'f');
INSERT INTO "public"."users" VALUES (186, 'Helen Wood', 'woodhelen@yahoo.com', '6ee32ea2bae6794bcdc07551fc4bc439', 'f');
INSERT INTO "public"."users" VALUES (187, 'Diane Simpson', 'simpson903@mail.com', 'a8daf028de833e4e9714594b5f2c3e4e', 'f');
INSERT INTO "public"."users" VALUES (188, 'Earl Holmes', 'eah@icloud.com', '87950c511ddd85c2ae5419ae70448a57', 't');
INSERT INTO "public"."users" VALUES (189, 'Jack Gonzales', 'jackgonzales1015@hotmail.com', 'cffccc299f03412c75d2b6e5d782f659', 't');
INSERT INTO "public"."users" VALUES (190, 'Virginia Reyes', 'virginiareyes43@icloud.com', '7c26af4cc984de7b07ec9d07c6e837d7', 't');
INSERT INTO "public"."users" VALUES (191, 'Jane Robinson', 'robinson1983@hotmail.com', '5c3ad015c0b2560feab88eb7888f306e', 't');
INSERT INTO "public"."users" VALUES (192, 'Valerie Perry', 'vap@gmail.com', '09ee9a465e386ef516b6bcda16a6d520', 'f');
INSERT INTO "public"."users" VALUES (193, 'Jerry Long', 'jerry324@hotmail.com', '94f80a99ee7535f9863f5a68d644e752', 't');
INSERT INTO "public"."users" VALUES (194, 'Thomas Martin', 'martinthomas91@hotmail.com', '68feca3a3de141cb170e082f3c8ec462', 't');
INSERT INTO "public"."users" VALUES (195, 'Dorothy Reed', 'doreed@icloud.com', '89aa0834e1a4c9f6911c850717553931', 't');
INSERT INTO "public"."users" VALUES (196, 'Katherine Sullivan', 'skatherine@outlook.com', '2ac35579d47347f709d004e4a7d1fd7a', 'f');
INSERT INTO "public"."users" VALUES (197, 'Sheila Smith', 'smiths@hotmail.com', 'b7e23752befcf50b9413abbdfc807993', 't');
INSERT INTO "public"."users" VALUES (198, 'Victoria Rose', 'rosevictoria2@mail.com', '070815ebd4f763abb25a7e9d8e137214', 'f');
INSERT INTO "public"."users" VALUES (199, 'Bonnie Dixon', 'bonnie721@outlook.com', '1f234b58640a5980798bca01f888bb7f', 'f');
INSERT INTO "public"."users" VALUES (200, 'Clifford Parker', 'cliffordp@gmail.com', 'b78a13b564aaf1ad2a92287a054c307a', 'f');
INSERT INTO "public"."users" VALUES (201, 'Patricia Peterson', 'peterson202@outlook.com', '1563a145129b78f086137ec0e0e194ae', 'f');
INSERT INTO "public"."users" VALUES (202, 'Ruby Price', 'priceruby1109@gmail.com', '9de62d3ac78609a94fe6573db3829eed', 't');
INSERT INTO "public"."users" VALUES (203, 'Dorothy Payne', 'dorotpayne505@icloud.com', 'ace9e153afe3c34b9f2f431ec26a6d2e', 't');
INSERT INTO "public"."users" VALUES (204, 'Joanne Mitchell', 'mjoa8@icloud.com', 'fce51d5f6aa4f22d2e41c9875bdd2fdd', 't');
INSERT INTO "public"."users" VALUES (205, 'Rebecca Gardner', 'rebeccag1128@icloud.com', 'dc3debbe0b03f493528e6380a91fce92', 'f');
INSERT INTO "public"."users" VALUES (206, 'Irene Shaw', 'irenesha@icloud.com', 'eb92faee2796aede64b26b74eace2ad6', 'f');
INSERT INTO "public"."users" VALUES (207, 'Frederick Jackson', 'fredja10@gmail.com', '4f31765aa1f5211f5f3185b5e8fa4289', 't');
INSERT INTO "public"."users" VALUES (208, 'Herbert Payne', 'herpay2@outlook.com', 'f579c417dd18f1487cdcc2f25f529af9', 't');
INSERT INTO "public"."users" VALUES (209, 'Patrick Murray', 'murraypa85@yahoo.com', 'fa6018524caeaa79d080ab6cdf8a44d4', 'f');
INSERT INTO "public"."users" VALUES (210, 'Keith Henry', 'keithhe@icloud.com', '43920ca26d8e554886b2e43d59f0d7b9', 't');
INSERT INTO "public"."users" VALUES (211, 'Arthur Hernandez', 'arthur531@mail.com', '556dbcbb0bc58138a312e75e95a1dfb5', 't');
INSERT INTO "public"."users" VALUES (212, 'Frank Williams', 'frwill@icloud.com', 'fe2d85681b6a395fb4212d045c381e32', 'f');
INSERT INTO "public"."users" VALUES (213, 'Nathan Foster', 'nathanfoster@gmail.com', 'a03dfc70cccf11c5c24305055199ae81', 't');
INSERT INTO "public"."users" VALUES (214, 'Francisco Henry', 'henry2@hotmail.com', 'a26cd805b1d932d652307c23d10238a1', 't');
INSERT INTO "public"."users" VALUES (215, 'Amy Perez', 'amp@yahoo.com', '115a09ccedbe155ad32287c8869f329d', 'f');
INSERT INTO "public"."users" VALUES (216, 'Robert Watson', 'watson8@mail.com', 'f67242bba9521a38131cf8dea4a03865', 't');
INSERT INTO "public"."users" VALUES (217, 'Betty Hernandez', 'bethe@yahoo.com', 'e93c2e8418e6cbc746cd33ec245c100f', 'f');
INSERT INTO "public"."users" VALUES (218, 'Travis Wagner', 'traviswagn@gmail.com', '3f1a0f8532088bd648fcce5036bd3386', 'f');
INSERT INTO "public"."users" VALUES (219, 'Elizabeth Fernandez', 'elizfer506@icloud.com', '5376e6858f45845b8bea953c908a2ee6', 't');
INSERT INTO "public"."users" VALUES (220, 'Adam Kelly', 'kellyad817@icloud.com', '6b65ffea14984334214d2503a55d00a5', 't');
INSERT INTO "public"."users" VALUES (221, 'Jennifer Cox', 'jenniferco@hotmail.com', 'bc46429d9d1ffb99e27210386e36c35c', 'f');
INSERT INTO "public"."users" VALUES (222, 'Maria Henry', 'mariah127@outlook.com', '986af6620114c35a47f4fdeba8d0ccd5', 't');
INSERT INTO "public"."users" VALUES (223, 'Leslie Castro', 'leslic@gmail.com', '00479bbf7301c0353670f85b16ddca30', 'f');
INSERT INTO "public"."users" VALUES (224, 'Valerie Mills', 'mval@mail.com', '86d35c11eb8967e5d8d49fa7776cae5e', 'f');
INSERT INTO "public"."users" VALUES (225, 'Stanley Stephens', 'stes70@mail.com', '28aaef66f2c7168afd472a3fa682f064', 't');
INSERT INTO "public"."users" VALUES (226, 'Clifford Woods', 'cliffordwoods@yahoo.com', '28dcc34270063b9404b57334770bca70', 'f');
INSERT INTO "public"."users" VALUES (227, 'Diane Mason', 'mdiane@gmail.com', '33daa3f85a5e46a826aeab6a7a52c03f', 'f');
INSERT INTO "public"."users" VALUES (228, 'Carolyn Price', 'carolynpri@yahoo.com', '8e5d364226a0105bb2f2c1be7e088b66', 'f');
INSERT INTO "public"."users" VALUES (229, 'Henry Woods', 'henry1010@yahoo.com', '56d79b77fef4350c677ea130d18937e5', 'f');
INSERT INTO "public"."users" VALUES (230, 'Terry Sanders', 'sanders59@mail.com', '304a3bc14b5bd07a2acce906247c213a', 't');
INSERT INTO "public"."users" VALUES (231, 'Betty Ramos', 'betty415@outlook.com', '845d66482d6110868e719b292e50e966', 'f');
INSERT INTO "public"."users" VALUES (232, 'Harry Lopez', 'lopezha@outlook.com', 'a261dba758e76d304eef77547cee4c16', 't');
INSERT INTO "public"."users" VALUES (233, 'Chad Gordon', 'chadgordon@outlook.com', '925cbca04079f16a54b56c2fad08145e', 'f');
INSERT INTO "public"."users" VALUES (234, 'Jesse Moreno', 'jm04@outlook.com', 'ed522389c30170b21bc3620a93c8f455', 'f');
INSERT INTO "public"."users" VALUES (235, 'Timothy Cooper', 'coopertimo@icloud.com', '197bb6e123aac3d9faeeefe6f6fc77d0', 't');
INSERT INTO "public"."users" VALUES (236, 'Jeff Hamilton', 'jeffhamilton95@outlook.com', 'cda1140550a2caf33172e8b4b951a884', 'f');
INSERT INTO "public"."users" VALUES (237, 'Denise Ramirez', 'ramirezdenise@gmail.com', 'd825dfd70b25a13c925d308f580d72ed', 'f');
INSERT INTO "public"."users" VALUES (238, 'Ricky Alexander', 'alericky2@gmail.com', 'cd3bee3e0829c43c927e3b5f5a63e717', 't');
INSERT INTO "public"."users" VALUES (239, 'Cynthia Washington', 'cynthiawashington3@gmail.com', '46a33b10d4ce8242557700b902782774', 't');
INSERT INTO "public"."users" VALUES (240, 'Bradley Walker', 'walkerbradley6@icloud.com', '35ed66ca45f44539e648338542632508', 't');
INSERT INTO "public"."users" VALUES (241, 'Patricia West', 'patriciawest@hotmail.com', '85a720ba994c6942b5bfd1b0cf85d1da', 'f');
INSERT INTO "public"."users" VALUES (242, 'Patrick Warren', 'patrick124@hotmail.com', 'b545ef31f1f94b8fa40873691c24896b', 'f');
INSERT INTO "public"."users" VALUES (243, 'Jason White', 'jasonw@yahoo.com', '6be7340562a1a0e8f0f37ff2760caf94', 't');
INSERT INTO "public"."users" VALUES (244, 'Linda Diaz', 'dilinda97@outlook.com', 'ad0def340d00ec7af81ceb80bad5e99f', 'f');
INSERT INTO "public"."users" VALUES (245, 'Allen Young', 'alyoung@gmail.com', 'fe05e4897a01c9aef569b8d6c5793a39', 'f');
INSERT INTO "public"."users" VALUES (246, 'Tony Gardner', 'gardner2@icloud.com', 'f9cceafeb1c29b404ee40ded2d2246fb', 't');
INSERT INTO "public"."users" VALUES (247, 'Carmen Myers', 'cmyer@gmail.com', '00a5e35547c73bb4e3e8da334b6b8c43', 'f');
INSERT INTO "public"."users" VALUES (248, 'Florence Chen', 'chefl1009@mail.com', '7395d3811f0ce9229bd7836e77519316', 'f');
INSERT INTO "public"."users" VALUES (249, 'Gladys Kelly', 'kelly19@gmail.com', '8a8c75d3c15db6c27bfd2e35e1898864', 'f');
INSERT INTO "public"."users" VALUES (250, 'Kyle Meyer', 'kme215@icloud.com', '96c28a9c18c5f1dc38b3cbd7f5c9fb2f', 't');
INSERT INTO "public"."users" VALUES (251, 'Troy Kelley', 'kelletro2@gmail.com', 'fca7b52994ce1a04603b700c5a8e4da5', 't');
INSERT INTO "public"."users" VALUES (252, 'Danielle Munoz', 'mdani@mail.com', 'f3030cf00152fcc0667f8272da2e8498', 't');
INSERT INTO "public"."users" VALUES (253, 'Doris Harris', 'doris1107@icloud.com', 'f4012b15232efd1815da63c05e91ca1a', 't');
INSERT INTO "public"."users" VALUES (254, 'Earl Mason', 'masoearl@outlook.com', 'b4f6072b59726fc008c5e0daa848e17c', 't');
INSERT INTO "public"."users" VALUES (255, 'Martha Boyd', 'martboyd402@outlook.com', '49d4b2ec78602cd9226ed9ad709f6aec', 't');
INSERT INTO "public"."users" VALUES (256, 'Norman Morris', 'normanmorr@icloud.com', 'c4a88ee800d34a91225cda80822244a6', 't');
INSERT INTO "public"."users" VALUES (257, 'Bryan Nguyen', 'nguyen313@gmail.com', 'ca4479174e58a63b3a3966aea2504af4', 'f');
INSERT INTO "public"."users" VALUES (258, 'Margaret Ellis', 'ellismargaret822@outlook.com', '4e1fc79aa2dfa853673b6a0eb7e34fd5', 'f');
INSERT INTO "public"."users" VALUES (259, 'Eva Hayes', 'hev1212@yahoo.com', 'a615fd56d1f0527ba69e42affb6ca397', 't');
INSERT INTO "public"."users" VALUES (260, 'Monica Harrison', 'harrison204@outlook.com', 'd01c2b8b2442464ab8ce3ac4276bae1c', 't');
INSERT INTO "public"."users" VALUES (261, 'Benjamin Campbell', 'bencampbell@hotmail.com', '461bd51bf1e0795867e0654d4a43e23c', 'f');
INSERT INTO "public"."users" VALUES (262, 'Tony Ortiz', 'ortiztony5@outlook.com', '9f47ff5519e902a58753a7a750dc4224', 'f');
INSERT INTO "public"."users" VALUES (263, 'Christina Wallace', 'wallachristina1@icloud.com', '3370714dd6b4142414653460dae0b1b8', 't');
INSERT INTO "public"."users" VALUES (264, 'Jimmy Phillips', 'philljim62@mail.com', 'a369014c85fd43bb089419998c9f28b3', 'f');
INSERT INTO "public"."users" VALUES (265, 'Tina Perry', 'tiperr5@gmail.com', '635ed1c4cb9c2abf9c09c4dbf5ad201b', 'f');
INSERT INTO "public"."users" VALUES (266, 'Teresa Peterson', 'teresapeterson@mail.com', '3ceaa5a2d9ae937a2cfb7799b9bcf64c', 't');
INSERT INTO "public"."users" VALUES (267, 'Antonio Mitchell', 'antoniom@gmail.com', 'b3c13302421c9fb2724782a0f7a2c122', 't');
INSERT INTO "public"."users" VALUES (268, 'Troy Taylor', 'troytayl@icloud.com', 'b719aac5ea3d31290203fd4d9a780cde', 't');
INSERT INTO "public"."users" VALUES (269, 'Judith Green', 'green8@mail.com', 'd120298249528913be9915a064ef9a35', 't');
INSERT INTO "public"."users" VALUES (270, 'Alan Ramirez', 'alanramirez@icloud.com', '229a993e9ef1a7e88f6a11247a495f17', 't');
INSERT INTO "public"."users" VALUES (271, 'Elizabeth Mason', 'elima416@icloud.com', 'd9028820c412929339e3ee35275a668d', 'f');
INSERT INTO "public"."users" VALUES (272, 'Edna Baker', 'bakered923@gmail.com', '59ba1ea49adc5cf6a36318b6c993d7f2', 'f');
INSERT INTO "public"."users" VALUES (273, 'Sherry Morales', 'shmo124@mail.com', '59120ccb65a40714881c87c04a219ea8', 'f');
INSERT INTO "public"."users" VALUES (274, 'Frank Burns', 'frankb7@yahoo.com', '3141aded567906e5f4af1f5ad7f5561a', 'f');
INSERT INTO "public"."users" VALUES (275, 'Denise Allen', 'adenise2@outlook.com', 'cf6068d128323e5b7bdbe6f15b48a420', 'f');
INSERT INTO "public"."users" VALUES (276, 'Jesus Fox', 'jesusf@outlook.com', '9b2a291b74dda045c23680a38297fac2', 'f');
INSERT INTO "public"."users" VALUES (277, 'Brandon Butler', 'bb83@outlook.com', 'e470e8275d82daf7ae20a0330e3c7299', 't');
INSERT INTO "public"."users" VALUES (278, 'Thomas Kelly', 'thomak@yahoo.com', 'b7377b7b0602c3d29ca5db65fed8009e', 't');
INSERT INTO "public"."users" VALUES (279, 'Roy Grant', 'grantroy6@mail.com', '0e0259ec963c1735493d60a939dac32a', 'f');
INSERT INTO "public"."users" VALUES (280, 'Mario Tran', 'maritran522@gmail.com', '91c81563ef8453d02251df5d84077f65', 't');
INSERT INTO "public"."users" VALUES (281, 'Eugene Jones', 'joneseugene@mail.com', 'dcbde4e534dfd1051a7ac04dbdfa5baa', 't');
INSERT INTO "public"."users" VALUES (282, 'Nicole Rivera', 'nicole07@icloud.com', '673e90e6457b248f777fe7e14819bb1a', 'f');
INSERT INTO "public"."users" VALUES (283, 'Tammy Daniels', 'dtammy211@outlook.com', '1c3381777b1abee7df9a87852593baf9', 't');
INSERT INTO "public"."users" VALUES (284, 'Ruby Simmons', 'simmons326@outlook.com', 'e0e891bbf17b7dcdf487f6e4e22e5868', 't');
INSERT INTO "public"."users" VALUES (285, 'Christine Taylor', 'tchri2@gmail.com', '711ffe05b281069fcf2ca304fdbf0c62', 'f');
INSERT INTO "public"."users" VALUES (286, 'Thomas Spencer', 'stho6@gmail.com', 'b117b02272e6426fa867ca738fd1a6df', 't');
INSERT INTO "public"."users" VALUES (287, 'Ellen Dunn', 'dunnelle1124@mail.com', '2c49b46f90082833516e5c43ca9dc19e', 'f');
INSERT INTO "public"."users" VALUES (288, 'Peggy Cole', 'peggyc@yahoo.com', '4e13b91bd26eaf7765c0c34c2f527c15', 'f');
INSERT INTO "public"."users" VALUES (289, 'Brenda Taylor', 'brendtaylor@gmail.com', '7e65b53ebc449bda6762608d5039daa1', 'f');
INSERT INTO "public"."users" VALUES (290, 'Stanley Alvarez', 'alvarez807@gmail.com', 'd573bad4e9bdf72ad1f25071a8e329de', 't');
INSERT INTO "public"."users" VALUES (291, 'Dale Nichols', 'dnicho@icloud.com', '17a1f25bd75de5b2c53c2cb1a417a73a', 'f');
INSERT INTO "public"."users" VALUES (292, 'Peter Kelley', 'kelleypeter518@icloud.com', 'ff30e0fa122ad78f9c229051bd83c036', 't');
INSERT INTO "public"."users" VALUES (293, 'Julie Moreno', 'morenojulie9@hotmail.com', 'ad073a34f06a192e4d84c6fd0bf6f747', 't');
INSERT INTO "public"."users" VALUES (294, 'Eugene Bailey', 'baileye@gmail.com', 'dd075768c3f0ae2b8518b100cdffa29d', 't');
INSERT INTO "public"."users" VALUES (295, 'Curtis Nelson', 'curtis816@hotmail.com', 'b4bb1bc84a6e3c561e7885b586916c78', 'f');
INSERT INTO "public"."users" VALUES (296, 'Teresa Mills', 'mteresa206@gmail.com', '360fe96acaee818ef269de8d173c059f', 't');
INSERT INTO "public"."users" VALUES (297, 'Diane Wright', 'wright2@icloud.com', '08fd268f30631a0517be72e953218414', 'f');
INSERT INTO "public"."users" VALUES (298, 'Tina Simpson', 'tsimpson67@mail.com', '23e4f2fbabacc204f3044f6805d4e2ff', 'f');
INSERT INTO "public"."users" VALUES (299, 'Herbert Rodriguez', 'rodriguez16@hotmail.com', '84d9d14669f86f9aa6451f089f23b89c', 't');
INSERT INTO "public"."users" VALUES (300, 'Jesse Hunt', 'jesse3@gmail.com', 'a14b58dbc046792ecdbb4a4f4196c565', 't');
INSERT INTO "public"."users" VALUES (301, 'April Adams', 'aadams@hotmail.com', '5e6dfbf5fbeadca0489a8f4da21aee80', 'f');
INSERT INTO "public"."users" VALUES (302, 'Theodore Reyes', 'reyestheodore@outlook.com', 'c0b1adb74d320a56c31f5e4012f1ca50', 'f');
INSERT INTO "public"."users" VALUES (303, 'Andrea Lee', 'lee2@gmail.com', '9c32db235d1a5e51e198e94a9612c8cf', 'f');
INSERT INTO "public"."users" VALUES (304, 'Maria Harris', 'harrismar3@yahoo.com', 'e7cfa952d6e01a201d586fb8a7e67d1e', 't');
INSERT INTO "public"."users" VALUES (305, 'Raymond Mitchell', 'mraymond@gmail.com', '77824e393806c5caac105b7e33a8cd80', 'f');
INSERT INTO "public"."users" VALUES (306, 'Vincent Reed', 'reedv@outlook.com', '99e1522c50a4ec7df320450000fccaa8', 'f');
INSERT INTO "public"."users" VALUES (307, 'Patrick Morgan', 'morgan89@yahoo.com', 'be92a48b5d895faf78a1bf5dc7cac008', 'f');
INSERT INTO "public"."users" VALUES (308, 'Francis Richardson', 'richf@yahoo.com', '94df282e57e31b48c64c850252362924', 'f');
INSERT INTO "public"."users" VALUES (309, 'Danny Jones', 'jones42@outlook.com', 'bde75037f01607cb54f97365a17b14c5', 't');
INSERT INTO "public"."users" VALUES (310, 'Troy Dunn', 'troydu@gmail.com', '7e6d91d2ef2e34eab594909dc367fa57', 't');
INSERT INTO "public"."users" VALUES (311, 'Kevin Allen', 'keallen1011@icloud.com', '94e3afde7cf4a29ff4bdd6409a63f186', 'f');
INSERT INTO "public"."users" VALUES (312, 'John Patterson', 'pattersonj@gmail.com', '441374fbf84a531d28871a3b71cb9d1e', 't');
INSERT INTO "public"."users" VALUES (313, 'Helen Carter', 'helen1208@mail.com', '4c43e64391d1c656abe61a7fa1ef8d8d', 'f');
INSERT INTO "public"."users" VALUES (314, 'Herbert Gonzalez', 'gonzaherbe@gmail.com', '87e6b8f01a5b93e85354bd8109822dde', 't');
INSERT INTO "public"."users" VALUES (315, 'Sandra Moore', 'moore65@yahoo.com', '34ece3297b48ca0eb0cca638ea2a95ec', 'f');
INSERT INTO "public"."users" VALUES (316, 'William Munoz', 'williammunoz@icloud.com', 'b340f77bee0c56e57f47bdbd79185694', 'f');
INSERT INTO "public"."users" VALUES (317, 'Martha Mason', 'marthamason6@outlook.com', 'afe761681ce96e061c2046291898d95d', 't');
INSERT INTO "public"."users" VALUES (318, 'Valerie Gonzalez', 'gvalerie@icloud.com', '825a9fde8e0d9a539959ad93e88df68d', 'f');
INSERT INTO "public"."users" VALUES (319, 'Jeremy Reyes', 'jerer@outlook.com', '5ed49aefee5c7cad0309d5b699317bef', 't');
INSERT INTO "public"."users" VALUES (320, 'Rhonda Medina', 'rhonda71@outlook.com', '76e4ade592b3e716c7e84547e8bc732a', 'f');
INSERT INTO "public"."users" VALUES (321, 'Janice Snyder', 'janice823@outlook.com', '007eb31ee654fe0ade90fb86e9777788', 'f');
INSERT INTO "public"."users" VALUES (322, 'Rosa Rogers', 'rrogers6@mail.com', '0d501c5ebbbb3744ed70ab9db6f5a685', 't');
INSERT INTO "public"."users" VALUES (323, 'Heather Russell', 'ruheath@icloud.com', '32ddc117b6e8d53f7095df9cca86c820', 't');
INSERT INTO "public"."users" VALUES (324, 'Joan Morris', 'morrjoan@gmail.com', 'a67257d9f7edc8ec99f910277e5c9a50', 'f');
INSERT INTO "public"."users" VALUES (325, 'Amber Munoz', 'amber7@yahoo.com', '2a6be0633019e435d0c92f693027a725', 't');
INSERT INTO "public"."users" VALUES (326, 'Helen Mcdonald', 'mhe405@mail.com', '2b6ad1fea3d6a282ed46388c2a9e737e', 't');
INSERT INTO "public"."users" VALUES (327, 'Raymond Davis', 'davraymond7@gmail.com', 'ffa48fb065f1f79b659db05d54911b22', 'f');
INSERT INTO "public"."users" VALUES (328, 'Joel Barnes', 'barnesjoel702@outlook.com', '4333e631631897d55bcb75280a24c571', 'f');
INSERT INTO "public"."users" VALUES (329, 'George Foster', 'georgefoster48@outlook.com', 'ff52ef58f7f9ec83db56d3339a9dc492', 't');
INSERT INTO "public"."users" VALUES (330, 'Billy Hunter', 'huntbil@outlook.com', '89ae8a7d91b0a561938ae8fb63ab7a2a', 'f');
INSERT INTO "public"."users" VALUES (331, 'Marilyn Jackson', 'jackmaril@icloud.com', '02b8d5c4a87e8bec6ab4a1ed2d07af95', 'f');
INSERT INTO "public"."users" VALUES (332, 'Frederick Vasquez', 'frev2006@hotmail.com', '0d75af1b02055e5101608f3a95ba23c4', 'f');
INSERT INTO "public"."users" VALUES (333, 'Arthur Bailey', 'arthur6@hotmail.com', 'bdd06ecfa7915950377545ec20cbaf93', 't');
INSERT INTO "public"."users" VALUES (334, 'Jason King', 'jason3@outlook.com', '2fc39250cbf97598d0e3c5e51ad7fefc', 'f');
INSERT INTO "public"."users" VALUES (335, 'Douglas Ward', 'douward307@mail.com', 'df410746654a561561c0f8fbf2050bbd', 't');
INSERT INTO "public"."users" VALUES (336, 'Bernard Green', 'bgreen@hotmail.com', '42bac1bb5c62cf53ba188e637e6cb612', 'f');
INSERT INTO "public"."users" VALUES (337, 'Carolyn Ortiz', 'carolyn6@gmail.com', 'b4fd929656da5be8f0771e8e85c827fe', 'f');
INSERT INTO "public"."users" VALUES (338, 'Steven Miller', 'millers513@icloud.com', 'e9c6571d237c901ab35bad1a6963b7f8', 't');
INSERT INTO "public"."users" VALUES (339, 'Leslie Holmes', 'leslieho@yahoo.com', '1e40f6d64dc1b107ba4a35b389c3d346', 'f');
INSERT INTO "public"."users" VALUES (340, 'Kim Mendoza', 'mendokim@gmail.com', '037f121b1d6982dedb05b5be8fa116c7', 't');
INSERT INTO "public"."users" VALUES (341, 'Sandra Munoz', 'munosandra@gmail.com', '795f4d8701cf3ea057058d04a491ffec', 'f');
INSERT INTO "public"."users" VALUES (342, 'Albert Dunn', 'dunal@icloud.com', '09ec8b2140aa669d23e93297a1dc7aae', 'f');
INSERT INTO "public"."users" VALUES (343, 'Valerie Green', 'vgreen@icloud.com', '30380236ef74efdb3f5e08c90c14474f', 't');
INSERT INTO "public"."users" VALUES (344, 'Stanley Stephens', 'ststephens@yahoo.com', '6976c37793deb0538ce0041bc36e903b', 't');
INSERT INTO "public"."users" VALUES (345, 'Melvin Crawford', 'crawford8@icloud.com', 'a38b70b592bfa8fe707d313e97108204', 't');
INSERT INTO "public"."users" VALUES (346, 'Lee Hall', 'lhal@gmail.com', 'b19d88cd31c0eb834b20aa54ead49ae3', 'f');
INSERT INTO "public"."users" VALUES (347, 'Billy Nguyen', 'billynguyen10@icloud.com', '35f2b8bc092c15da1c9695836b7305fc', 'f');
INSERT INTO "public"."users" VALUES (348, 'Sean Nguyen', 'seann@yahoo.com', 'db2ff05d2475099a73e37951b771ab61', 'f');
INSERT INTO "public"."users" VALUES (349, 'Bernard Johnson', 'johnsonbernard@gmail.com', 'c77d09bb981bf42a69689a64a06889ce', 'f');
INSERT INTO "public"."users" VALUES (350, 'Jimmy Robertson', 'jirobertson@icloud.com', 'a41f1ac1cef10effa82e1b70916cdcce', 'f');
INSERT INTO "public"."users" VALUES (351, 'Bobby Castillo', 'bobbyca1977@gmail.com', 'fbc6537a060ccf6006959845e960c6cc', 't');
INSERT INTO "public"."users" VALUES (352, 'Luis Boyd', 'luisb@icloud.com', '7a208d0e2f749ea3eafc73c8f909a792', 'f');
INSERT INTO "public"."users" VALUES (353, 'Beverly Stevens', 'beverly1@icloud.com', '3622488cfdf00d4aeace44ccb97e9506', 't');
INSERT INTO "public"."users" VALUES (354, 'Carlos Boyd', 'bocar910@yahoo.com', '1399288fd3c4076c395a0f65505b0c77', 't');
INSERT INTO "public"."users" VALUES (355, 'Melvin Tucker', 'melvin85@outlook.com', 'c425c96eeb7b1b0251885fdb7a8bc43c', 't');
INSERT INTO "public"."users" VALUES (356, 'Edith Hall', 'hed@outlook.com', '8288d17f52d46354df7d3b900744935f', 'f');
INSERT INTO "public"."users" VALUES (357, 'Christine Mills', 'christinemills@hotmail.com', '6cf8346a580306b03d67e60e02de33d4', 'f');
INSERT INTO "public"."users" VALUES (358, 'Carl Spencer', 'scarl@mail.com', 'd0740597494e3b32560f7deb1db09537', 't');
INSERT INTO "public"."users" VALUES (359, 'Mary Fernandez', 'femary@mail.com', '97751a763ee67e21e5b31d84d6afa7db', 'f');
INSERT INTO "public"."users" VALUES (360, 'Wendy Herrera', 'wherrera@icloud.com', '3438436af2d34913f9e7abfa3ffd19f2', 'f');
INSERT INTO "public"."users" VALUES (361, 'Sylvia Salazar', 'sylvia4@outlook.com', '39d68ee59a33199a5ec0a9032ac8d443', 't');
INSERT INTO "public"."users" VALUES (362, 'Melvin Allen', 'allen9@outlook.com', 'ea126ce878416145c53caca0dca0085d', 'f');
INSERT INTO "public"."users" VALUES (363, 'Carmen Lopez', 'lopezc@gmail.com', '357800b08fcf0070758759cb983d53a8', 'f');
INSERT INTO "public"."users" VALUES (364, 'Brenda Marshall', 'marsbren@yahoo.com', '003adc2701ea29f8f219ddd2354e05b3', 'f');
INSERT INTO "public"."users" VALUES (365, 'Brenda Gonzalez', 'gonbr@gmail.com', 'cd96afc302e76671b58c0f54a922d155', 'f');
INSERT INTO "public"."users" VALUES (366, 'Joel Coleman', 'joelcoleman9@icloud.com', '1a0ef6e279769c70b4847c9fe119996d', 't');
INSERT INTO "public"."users" VALUES (367, 'Samuel Anderson', 'samuel58@gmail.com', '94e9f6df281e94f0e8c1031cf0cd86d0', 'f');
INSERT INTO "public"."users" VALUES (368, 'Anita Gordon', 'goanita5@outlook.com', '2dfbed94f0f519378e0eec109301fbaa', 't');
INSERT INTO "public"."users" VALUES (369, 'Russell Russell', 'russell68@outlook.com', '4a9464914e30561e909da2bd2a95c726', 'f');
INSERT INTO "public"."users" VALUES (370, 'Jeremy Campbell', 'jereca1@mail.com', '4470779bdd49d18c741279db0a9db168', 'f');
INSERT INTO "public"."users" VALUES (371, 'John Cox', 'john3@gmail.com', 'e283e40501a210a12f4abf01ec2e7f77', 't');
INSERT INTO "public"."users" VALUES (372, 'Rosa Gomez', 'rogome@outlook.com', '61cfc1baca65a310b3ddaa1b2b7969c0', 'f');
INSERT INTO "public"."users" VALUES (373, 'Joan Lewis', 'ljo@gmail.com', 'cd9d13df0e3e94238a06be36e3d6c9f8', 'f');
INSERT INTO "public"."users" VALUES (374, 'Douglas Munoz', 'mdouglas@gmail.com', '4ab25abe57b2d738765f0775a5fcfdb0', 'f');
INSERT INTO "public"."users" VALUES (375, 'Julie Jackson', 'jackson228@icloud.com', '607f377dd2d85c054b3b1cf178f96838', 'f');
INSERT INTO "public"."users" VALUES (376, 'Donna Morales', 'donna901@hotmail.com', 'c53a56cc425e6a69543f946028ce9f0e', 't');
INSERT INTO "public"."users" VALUES (377, 'Marie Patel', 'mariepatel@outlook.com', '53ec714c02a2044f1455fd31d05fd3bd', 'f');
INSERT INTO "public"."users" VALUES (378, 'Jason Thompson', 'thoj@outlook.com', '44ae588deeb7ab38f87d5e72add82cf8', 'f');
INSERT INTO "public"."users" VALUES (379, 'Craig Webb', 'webb3@hotmail.com', '6bd8a10a55f8732639060400698d13fc', 'f');
INSERT INTO "public"."users" VALUES (380, 'Lois Rice', 'rice7@yahoo.com', 'f5618b913118a3a0fddf2eb6d10ac431', 'f');
INSERT INTO "public"."users" VALUES (381, 'Judy Ramirez', 'ramjudy@gmail.com', '75506b8af55c082be26eb3a9821fc4b6', 'f');
INSERT INTO "public"."users" VALUES (382, 'Shirley Russell', 'shirrussell@outlook.com', '76c1c75d22446dac5098ed69ee715d84', 'f');
INSERT INTO "public"."users" VALUES (383, 'Eva Jimenez', 'jeva@outlook.com', '6a6e085637c478f937bb0eeb10c008e8', 't');
INSERT INTO "public"."users" VALUES (384, 'Jesus Walker', 'jesuswalk@gmail.com', '7989eb56f67a36ab2e3a546be25d2ec6', 't');
INSERT INTO "public"."users" VALUES (385, 'Kenneth Washington', 'washingtonke@gmail.com', 'da6774cf539ba1c855077cfc397c6e42', 't');
INSERT INTO "public"."users" VALUES (386, 'Paul Jackson', 'jpaul1229@icloud.com', '701c3912de2d342dbf06ba3b9da4e4f3', 'f');
INSERT INTO "public"."users" VALUES (387, 'Joseph Aguilar', 'josaguilar7@outlook.com', '80c602b24be901dc8befdc7c05eb183a', 'f');
INSERT INTO "public"."users" VALUES (388, 'Carolyn Holmes', 'hocarolyn3@outlook.com', '2a4b721528090b5c7f5cf7ba85fe2af4', 'f');
INSERT INTO "public"."users" VALUES (389, 'Ann Wells', 'annw3@outlook.com', '12d801880e2ea2fe3c8a01f387a5a3fb', 'f');
INSERT INTO "public"."users" VALUES (390, 'Denise Bryant', 'denise2004@gmail.com', '827d789a065ae823547c394ac52edcda', 't');
INSERT INTO "public"."users" VALUES (391, 'Louise Evans', 'louise53@mail.com', 'e51b3a89ddaef6312e7298e24e7a207a', 't');
INSERT INTO "public"."users" VALUES (392, 'Judith Stephens', 'jsteph@gmail.com', '819e17ff7eb14d8f9eaec487183d4daa', 't');
INSERT INTO "public"."users" VALUES (393, 'Amy Hayes', 'haamy@gmail.com', 'ca44306ce4ed74117307e55a7abe2fb7', 't');
INSERT INTO "public"."users" VALUES (394, 'Bonnie Miller', 'bonniemil@icloud.com', 'bfacd668f95a68932fa3adb717b7d571', 'f');
INSERT INTO "public"."users" VALUES (395, 'Travis Taylor', 'taylortra@icloud.com', '0085859d689e82f35d1d02c938a0481f', 't');
INSERT INTO "public"."users" VALUES (396, 'Todd Ramos', 'toddramos206@gmail.com', '2b9d27aca1200dac3b47311a8bdbebb2', 'f');
INSERT INTO "public"."users" VALUES (397, 'Christina Castillo', 'castillochr@mail.com', 'bcab0b6fd9ecff426c7861193c6e40e2', 't');
INSERT INTO "public"."users" VALUES (398, 'Nancy Parker', 'napa@outlook.com', '9f1915aa3a776c256c497c63f86bad40', 't');
INSERT INTO "public"."users" VALUES (399, 'Katherine Nelson', 'kathnelson4@gmail.com', '67544d245811ffe75f7229b3f06376ec', 't');
INSERT INTO "public"."users" VALUES (400, 'Micheal Warren', 'warren805@outlook.com', 'e3e3f18621c57f450d76de0511ab33c3', 'f');
INSERT INTO "public"."users" VALUES (401, 'Eddie Young', 'eddiey@hotmail.com', '4671aa7b1f6194b4e6cc5f13b5436599', 'f');
INSERT INTO "public"."users" VALUES (402, 'Monica Baker', 'bakmon47@yahoo.com', 'ed4f2c2ae1f9ae64b3e83a34204d718a', 't');
INSERT INTO "public"."users" VALUES (403, 'Joseph Thompson', 'josephtho@yahoo.com', '6fa04628de7dd2e0734833301f534ab9', 'f');
INSERT INTO "public"."users" VALUES (404, 'Tracy Soto', 'tracys02@gmail.com', '7e12a17c524da96199deabea88f19e5f', 'f');
INSERT INTO "public"."users" VALUES (405, 'Louis Butler', 'lbutler@outlook.com', 'c0e334d0f266579a0248c5babffed2c5', 'f');
INSERT INTO "public"."users" VALUES (406, 'Benjamin Jackson', 'jackson1961@hotmail.com', '5011c2b32d36a0409a5ec5454ec815e6', 't');
INSERT INTO "public"."users" VALUES (407, 'Sharon Richardson', 'sharricha@outlook.com', '3daadf19a974ac9f1d9d573ce3ae1251', 't');
INSERT INTO "public"."users" VALUES (408, 'Francis Torres', 'torrfrancis@outlook.com', 'dcea3a6b2c2a3cb2b9e3b2708ef8c6cc', 't');
INSERT INTO "public"."users" VALUES (409, 'Irene Alvarez', 'alvarezirene1977@outlook.com', 'e9fc6a0493e41f72380374bded447fad', 'f');
INSERT INTO "public"."users" VALUES (410, 'Peggy Hunter', 'hunterpe2012@mail.com', 'a1a955d7c8f575b992ec1106da9d0204', 'f');
INSERT INTO "public"."users" VALUES (411, 'Teresa Crawford', 'tercrawford@outlook.com', '919d1dc7c33e456266db8458e32745b2', 't');
INSERT INTO "public"."users" VALUES (412, 'Russell Freeman', 'russell512@yahoo.com', '62c1c947dd090684d5090c31ee015c3b', 'f');
INSERT INTO "public"."users" VALUES (413, 'Cynthia West', 'cynthiawe221@gmail.com', '1099f4b9db6df3da61f9cca4b31bfa4a', 't');
INSERT INTO "public"."users" VALUES (414, 'Janet Carter', 'cjanet4@yahoo.com', '271ac11980f36b80bc0e788717044631', 't');
INSERT INTO "public"."users" VALUES (415, 'Rodney Hill', 'hillrodne@outlook.com', '15afbca0618ba8126fbff19745373b19', 't');
INSERT INTO "public"."users" VALUES (416, 'Shirley Martinez', 'smar@gmail.com', '6ef3e50b091e204c90e810882cbaf299', 't');
INSERT INTO "public"."users" VALUES (417, 'Stephen Kim', 'stephenkim127@hotmail.com', '86b329a84312158453e7708264395bae', 'f');
INSERT INTO "public"."users" VALUES (418, 'Randy Mendoza', 'randy19@outlook.com', '9e4bd5d790880ed4130b5db8d5a50174', 'f');
INSERT INTO "public"."users" VALUES (419, 'Eleanor Kim', 'kimel1213@gmail.com', '9af66adb55f124d9fffa9f4fa0ba058b', 't');
INSERT INTO "public"."users" VALUES (420, 'Christina Garcia', 'garciac@mail.com', '792212b61ac37a6252ac42184bbd6e2a', 't');
INSERT INTO "public"."users" VALUES (421, 'Dawn Robinson', 'dawnrobinson@yahoo.com', '03abbfb38b4914336eab1d66b8330d03', 't');
INSERT INTO "public"."users" VALUES (422, 'Julie Cruz', 'jucruz@icloud.com', 'db1431e6e28a9d35cda2773932c4b707', 'f');
INSERT INTO "public"."users" VALUES (423, 'Henry Moreno', 'moreno1207@outlook.com', 'f8d3fbb78038236405cbcc673c26e902', 'f');
INSERT INTO "public"."users" VALUES (424, 'Andrea Brooks', 'brookandr@yahoo.com', 'c53e1b0693f20a6b75428bed2433d978', 't');
INSERT INTO "public"."users" VALUES (425, 'Evelyn Wright', 'ew1223@icloud.com', '3095688ced626a9477aded637c4f6db1', 'f');
INSERT INTO "public"."users" VALUES (426, 'Ralph Hunt', 'hunralph@hotmail.com', 'aa0f2872abcc87ced1356767bf904fc7', 't');
INSERT INTO "public"."users" VALUES (427, 'Clarence Vasquez', 'vasclarence624@icloud.com', 'c1aaaf927e1a0adf4621055f533f681a', 'f');
INSERT INTO "public"."users" VALUES (428, 'Stanley Jordan', 'jordas1944@gmail.com', '130679b485759dd2b91bf6e011573796', 'f');
INSERT INTO "public"."users" VALUES (429, 'Steve Russell', 'srussell88@gmail.com', 'a509316d9dc8d7d54f0d50487386d02a', 't');
INSERT INTO "public"."users" VALUES (430, 'Rebecca Castro', 'castro1011@outlook.com', '6de311dfc0f1fff93ab257a5b9b501ce', 'f');
INSERT INTO "public"."users" VALUES (431, 'Roy Daniels', 'danielsr@gmail.com', '28230a2fed0c135bee514043d7f723f1', 't');
INSERT INTO "public"."users" VALUES (432, 'Jeremy Kelley', 'jeremykelley@gmail.com', '9f4850d6ad17b37e60658944fdfdfcb5', 't');
INSERT INTO "public"."users" VALUES (433, 'Craig Barnes', 'craibarnes@yahoo.com', '1b5a1d0493fa4175b11ff82fd8334539', 'f');
INSERT INTO "public"."users" VALUES (434, 'Norma Taylor', 'taylor701@hotmail.com', 'afc7be146e19a92bd13bbcf01a707b96', 't');
INSERT INTO "public"."users" VALUES (435, 'Emily Morales', 'emilym119@icloud.com', '4fc8a96950d0949cae6a47bc94f56143', 'f');
INSERT INTO "public"."users" VALUES (436, 'Victor Hicks', 'victorhicks@hotmail.com', 'ccc828a5c7f09ce7bc2d26d51f38e859', 't');
INSERT INTO "public"."users" VALUES (437, 'Francisco Hill', 'hif3@hotmail.com', 'edd9847afb370fb266eb356a85dce4b3', 't');
INSERT INTO "public"."users" VALUES (438, 'Nicholas Garza', 'ngarza2007@gmail.com', 'b71307e0b9ef8fb7505595dbf8d1741d', 't');
INSERT INTO "public"."users" VALUES (439, 'Barbara Murphy', 'barbamurphy@hotmail.com', '623e84215034064dbbc5a1fc610c7657', 'f');
INSERT INTO "public"."users" VALUES (440, 'Teresa Richardson', 'rit@gmail.com', '26dd82cc56b08cd4490686a5de5e3888', 'f');
INSERT INTO "public"."users" VALUES (441, 'Jack Brown', 'jacb@outlook.com', '4b003222be7d12495229cb090bfe497f', 't');
INSERT INTO "public"."users" VALUES (442, 'Jonathan James', 'jjames@gmail.com', '2ce37ead37053a451eba9cfa72b477fb', 't');
INSERT INTO "public"."users" VALUES (443, 'Phillip Wagner', 'philwa6@icloud.com', '3d2c22ad424ed3877bcb527b12afc0cf', 't');
INSERT INTO "public"."users" VALUES (444, 'John Richardson', 'richardson79@yahoo.com', '511b229b19683cdd42e9fdb8b6ce3238', 'f');
INSERT INTO "public"."users" VALUES (445, 'Jeffery Carter', 'carter6@yahoo.com', '766e7d45a43f243488ca86ed4e77c874', 't');
INSERT INTO "public"."users" VALUES (446, 'Billy Wright', 'wrighbilly@yahoo.com', 'a361899fcf825557a771b6987c81afea', 'f');
INSERT INTO "public"."users" VALUES (447, 'Amy Woods', 'wa9@icloud.com', 'b824ab1b5d1e2e3479c17e1b649837cb', 'f');
INSERT INTO "public"."users" VALUES (448, 'Juanita Howard', 'howjuanita8@outlook.com', '4b579e16575a9f974dddcb4d3e39ad93', 'f');
INSERT INTO "public"."users" VALUES (449, 'Albert Mills', 'mialbe1227@gmail.com', '6249308811ed602957229416f85aa5f9', 'f');
INSERT INTO "public"."users" VALUES (450, 'Stephen Hamilton', 'hamiltonstephen@outlook.com', '94bdda7da300906c61f0d64550e0039d', 't');
INSERT INTO "public"."users" VALUES (451, 'Patricia Fox', 'foxpatricia619@icloud.com', 'fb3d0ec8898714efa823994dfa17a1cd', 't');
INSERT INTO "public"."users" VALUES (452, 'Micheal Hughes', 'michehughe9@icloud.com', 'ad97fa562c3bd60dc8dbe63629664baa', 'f');
INSERT INTO "public"."users" VALUES (453, 'William Morales', 'moraleswilli7@gmail.com', '4550a3b4bc0523ea294c51d1218f5a15', 'f');
INSERT INTO "public"."users" VALUES (454, 'Patricia Woods', 'woodpatricia@icloud.com', 'dfddede7f8d51bd0985d9fba0b046ef3', 'f');
INSERT INTO "public"."users" VALUES (455, 'Mary Gomez', 'gmary7@outlook.com', '4aefd6435ea9af4dcb96d648ae8dc885', 't');
INSERT INTO "public"."users" VALUES (456, 'Lisa Mills', 'millslisa7@outlook.com', 'a43fec62d7c831114a4f5e4468e1615d', 't');
INSERT INTO "public"."users" VALUES (457, 'Carmen Baker', 'bakerc10@outlook.com', 'a5b31ac5a5873769e04f5c29a7199cae', 't');
INSERT INTO "public"."users" VALUES (458, 'Joseph Butler', 'josephb54@gmail.com', '2800f1d163fd393dc97e08740f72de21', 't');
INSERT INTO "public"."users" VALUES (459, 'Vincent Hughes', 'vincenth@yahoo.com', '234bc44efac23dae9c4ffc11f56a4c24', 'f');
INSERT INTO "public"."users" VALUES (460, 'Josephine Miller', 'millerjosephine222@icloud.com', '74d8a83fda16e42bb6e85347768b3e4a', 't');
INSERT INTO "public"."users" VALUES (461, 'Frank Graham', 'grafra9@outlook.com', 'be91c5f75a7a4f8d6a961bf1114a524d', 'f');
INSERT INTO "public"."users" VALUES (462, 'Curtis Stevens', 'stevens5@outlook.com', 'e75c7c0c93e859a4030502f0cc7a9a30', 't');
INSERT INTO "public"."users" VALUES (463, 'Cindy Hunter', 'cindyhunter430@mail.com', 'ccef380b43ac07294cb751403f7fe3fe', 't');
INSERT INTO "public"."users" VALUES (464, 'Leroy Cole', 'colleroy55@yahoo.com', 'afdcc69c8938e2669c8fae1471b7b396', 'f');
INSERT INTO "public"."users" VALUES (465, 'Billy Henderson', 'hbilly1@mail.com', '6eb94b8bd46c512eebf5004525760d60', 'f');
INSERT INTO "public"."users" VALUES (466, 'Carolyn Burns', 'carolyn519@gmail.com', '682363d189dd402ba32ce405de95f51a', 'f');
INSERT INTO "public"."users" VALUES (467, 'Melissa Rogers', 'rogersmelis208@mail.com', '0e039f1c65899f6aa1f6289dc377789d', 'f');
INSERT INTO "public"."users" VALUES (468, 'Thomas King', 'thomasking808@hotmail.com', '95ca8a6edca3713b95c99db921277941', 'f');
INSERT INTO "public"."users" VALUES (469, 'Mike Payne', 'mikpa@gmail.com', 'c1074d6f4ba4d37b800ac96004412bf6', 't');
INSERT INTO "public"."users" VALUES (470, 'Dennis Palmer', 'palmerdennis709@outlook.com', 'e22b0b6ee04bf033540e37ea99fe559d', 'f');
INSERT INTO "public"."users" VALUES (471, 'Peggy Soto', 'spegg520@icloud.com', 'bcbfb649eef53ee7e7a18649c5a724e4', 't');
INSERT INTO "public"."users" VALUES (472, 'Jane Hunter', 'hunterjane@gmail.com', 'f130abc4510831cf3306bf0856a0c97f', 'f');
INSERT INTO "public"."users" VALUES (473, 'Paul Moreno', 'morenopaul@icloud.com', 'aba22c09a00cb302bc13b17e3d180386', 't');
INSERT INTO "public"."users" VALUES (474, 'Alice Gonzalez', 'ga4@gmail.com', '30d16cb7e696638edfffc0ce4a071e87', 't');
INSERT INTO "public"."users" VALUES (475, 'Howard Burns', 'hb5@outlook.com', '20d6bcf26daa507d4b079c74b5681132', 'f');
INSERT INTO "public"."users" VALUES (476, 'Ruby Wood', 'ruwo@yahoo.com', 'ee361fa4350bd0e7dc3b3662a8c22f94', 't');
INSERT INTO "public"."users" VALUES (477, 'Roy Williams', 'roywil@hotmail.com', 'c93423c3e6bda8c65803691397398f0a', 't');
INSERT INTO "public"."users" VALUES (478, 'Jeff Davis', 'jeffd427@hotmail.com', '0a1b94ccab21a2487590c746a902b247', 't');
INSERT INTO "public"."users" VALUES (479, 'Monica Reynolds', 'reynomonica@mail.com', 'd18f1bac223ef022d2226869017e8da8', 't');
INSERT INTO "public"."users" VALUES (480, 'Grace Hamilton', 'hamilton1207@gmail.com', '1c517cb561a3914372ff41bdde763888', 'f');
INSERT INTO "public"."users" VALUES (481, 'Larry Campbell', 'larrc3@outlook.com', 'fe44efbcf5cfa6f3d8159f6ba3a8c3c8', 'f');
INSERT INTO "public"."users" VALUES (482, 'Lillian Bryant', 'lillibrya@yahoo.com', '7d7c952f2f8dbe929d09f5878d3aff22', 'f');
INSERT INTO "public"."users" VALUES (483, 'James Mills', 'mills8@hotmail.com', 'b8d5c5a7a21334d6144ec72e684b8fec', 'f');
INSERT INTO "public"."users" VALUES (484, 'Peggy Olson', 'peggyolson@outlook.com', 'a3490343abdf750dbae0c0887504dd98', 't');
INSERT INTO "public"."users" VALUES (485, 'Monica Hall', 'monicahall@yahoo.com', 'c9b96e7b9cd71daec9ccacd8e1bb9e44', 't');
INSERT INTO "public"."users" VALUES (486, 'Stephanie Turner', 'stephanietur43@mail.com', '94c381a4128a14b2d0c1831035c7263d', 't');
INSERT INTO "public"."users" VALUES (487, 'Mary Ramos', 'rma@mail.com', '25ae75061e45efde8060bf71804f8995', 't');
INSERT INTO "public"."users" VALUES (488, 'Victor King', 'vking2@outlook.com', 'ff70a828655837ed47cd68019de56926', 'f');
INSERT INTO "public"."users" VALUES (489, 'Bradley Young', 'youngb@mail.com', '909464631dbc1dbc567829205033efec', 'f');
INSERT INTO "public"."users" VALUES (490, 'Teresa Palmer', 'teresp4@icloud.com', 'e0b3b5ebd23b8044f329f7bb40c65b08', 't');
INSERT INTO "public"."users" VALUES (491, 'Alfred Lee', 'lealf322@icloud.com', 'fb5c8929cd774b9d333327e1846b07ba', 'f');
INSERT INTO "public"."users" VALUES (492, 'Tina Collins', 'tinacol1953@outlook.com', 'b3527c9e4127f5e62fa68d16f2c0f178', 'f');
INSERT INTO "public"."users" VALUES (493, 'Marcus Owens', 'owens424@hotmail.com', '2560b35bf0f9b7c4ccf26f7a9b4d8d9f', 't');
INSERT INTO "public"."users" VALUES (494, 'Lawrence Turner', 'lawret@yahoo.com', '29bfe11a45f37043251368310864e5bd', 'f');
INSERT INTO "public"."users" VALUES (495, 'Todd Soto', 'todsoto@mail.com', '40e3a236688eee90ef3533872fbd2276', 'f');
INSERT INTO "public"."users" VALUES (496, 'Thomas Taylor', 'taylor211@outlook.com', '807dff1fe53c1a66fd1c995a52bbfd4e', 'f');
INSERT INTO "public"."users" VALUES (497, 'Charlotte Daniels', 'danielscha@outlook.com', 'edf2d5fdd20527854b43134b93b4341e', 't');
INSERT INTO "public"."users" VALUES (498, 'Amanda Young', 'amandyoun@outlook.com', 'cda00bf086ca155139f0d89ca8141530', 't');
INSERT INTO "public"."users" VALUES (499, 'Anthony Murphy', 'muranthony@hotmail.com', 'ed9a3e9043ba4d68ff9bde158030043a', 't');
INSERT INTO "public"."users" VALUES (500, 'Angela Gonzales', 'gonza706@outlook.com', 'bf01bdaf2571d1f60d14e766cfc8d55e', 'f');
INSERT INTO "public"."users" VALUES (501, 'Kathy Ferguson', 'ferkathy9@icloud.com', '5a73f1512242c9402a1af6b3455e479a', 'f');
INSERT INTO "public"."users" VALUES (502, 'Jacob Collins', 'collj@gmail.com', '73a5aa7a7d3b3941044b48441bb1c382', 't');
INSERT INTO "public"."users" VALUES (503, 'Douglas Long', 'douglasl@hotmail.com', 'f00a4568bc94b09b4f07fb7cbd432219', 'f');
INSERT INTO "public"."users" VALUES (504, 'Charlotte Adams', 'charla1959@hotmail.com', 'c1a114509cd0fd19a75ec81f637415ef', 't');
INSERT INTO "public"."users" VALUES (505, 'Rachel Mendez', 'mendez50@hotmail.com', '6e433e8d9ae26169ebb6614f2b377f2a', 'f');
INSERT INTO "public"."users" VALUES (506, 'Raymond Johnson', 'raymojohn@hotmail.com', '1ac0a8be3f37868b8d95a79fcbd51085', 'f');
INSERT INTO "public"."users" VALUES (507, 'Andrea Dunn', 'andrea1214@hotmail.com', '2a0e7dbf761b8d5c7e44f04de9963785', 'f');
INSERT INTO "public"."users" VALUES (508, 'Johnny Wilson', 'johnny85@icloud.com', '824c131bc3ee4596cd4a007d25df659c', 'f');
INSERT INTO "public"."users" VALUES (509, 'Amy Robinson', 'amyrobinson@yahoo.com', 'adbe3dc9164ac74932944ca765ca22f0', 't');
INSERT INTO "public"."users" VALUES (510, 'Julie Russell', 'jru@outlook.com', '5818e70e7d6c88c29b7fdeee4b6ff449', 'f');
INSERT INTO "public"."users" VALUES (511, 'Patrick Hamilton', 'pah@yahoo.com', '1701d00fe0b6af24794f90708103da02', 'f');
INSERT INTO "public"."users" VALUES (512, 'Frances Soto', 'soto8@yahoo.com', '5b90d09227b4d43663a9fda92e9729f8', 't');
INSERT INTO "public"."users" VALUES (513, 'Marie Ryan', 'marieryan@icloud.com', 'd187c4b63fb4cc954bc2a07fc05495db', 'f');
INSERT INTO "public"."users" VALUES (514, 'Edna Lee', 'elee@hotmail.com', 'cbb71b86baa0630e4ebed97fff86f857', 'f');
INSERT INTO "public"."users" VALUES (515, 'Donna Gibson', 'donnagibso@icloud.com', '14dd64c1f4733192cda08e00e13466c0', 'f');
INSERT INTO "public"."users" VALUES (516, 'Kelly Johnson', 'johnsonkelly1110@icloud.com', 'ab2a2084015074e22d23a74d4c59341c', 't');
INSERT INTO "public"."users" VALUES (517, 'Keith Palmer', 'palkeith@yahoo.com', '0f53fb91b36b44f36f4ca0c658a6dee5', 'f');
INSERT INTO "public"."users" VALUES (518, 'Nicholas Stevens', 'nichs@hotmail.com', '8d874744f1f6f014ebfc98803d9d4fb4', 't');
INSERT INTO "public"."users" VALUES (519, 'Terry Ellis', 'te5@icloud.com', 'f849db97fb90700c014145d85ce30f0d', 'f');
INSERT INTO "public"."users" VALUES (520, 'Billy Kim', 'bkim@outlook.com', '015606aa3c0f649ac5b4e4f6cfbd974c', 'f');
INSERT INTO "public"."users" VALUES (521, 'Beverly Martinez', 'bevmartinez90@gmail.com', '663f84780b641c62a83695af612b41aa', 't');
INSERT INTO "public"."users" VALUES (522, 'Sharon Mills', 'sharmills1@gmail.com', 'd9cca638c34d1d998b1b00773a41274b', 'f');
INSERT INTO "public"."users" VALUES (523, 'Charles Ruiz', 'charles52@gmail.com', '29c9510cfb51dc0f6e5995c6ce2864d9', 'f');
INSERT INTO "public"."users" VALUES (524, 'Susan Howard', 'howard02@gmail.com', 'db9f1880352ac67e1bbca5ac1c993fde', 't');
INSERT INTO "public"."users" VALUES (525, 'Charlotte Ferguson', 'charlfer8@gmail.com', '1046073257e51a6b43a50347d6d6d71a', 't');
INSERT INTO "public"."users" VALUES (526, 'Julie Mills', 'millju602@outlook.com', '6bbb61adabdc617311568cd892873c0c', 'f');
INSERT INTO "public"."users" VALUES (527, 'Debbie Kim', 'kdeb@gmail.com', '212ec0d998995214be71c92124f2fad3', 't');
INSERT INTO "public"."users" VALUES (528, 'Raymond Tran', 'tran98@mail.com', '64a93a80efd488b71e598acd810676ce', 't');
INSERT INTO "public"."users" VALUES (529, 'James Morris', 'jammo@outlook.com', '928dc04d0db77815d645d08902393160', 't');
INSERT INTO "public"."users" VALUES (530, 'Matthew Powell', 'mpowell@hotmail.com', '143ef9181372262a7f5c8184dc4c73fc', 'f');
INSERT INTO "public"."users" VALUES (531, 'Brenda Martinez', 'brendamartinez@gmail.com', 'c209a616f18182d7bcc2372f41f90a9a', 't');
INSERT INTO "public"."users" VALUES (532, 'Micheal Salazar', 'salazarm@gmail.com', '50b681faf14beb2eaa8b7bc4d34f1c05', 'f');
INSERT INTO "public"."users" VALUES (533, 'Laura Walker', 'lawalker@gmail.com', '3126181afdba63bd4eb4d0d0640785b2', 't');
INSERT INTO "public"."users" VALUES (534, 'Phyllis Brown', 'phyllis10@yahoo.com', '4cc7a2e75761238d9d9a79ee3953b8de', 'f');
INSERT INTO "public"."users" VALUES (535, 'Larry Ellis', 'larrye@icloud.com', '3709e093164fbfec816503bc90de6837', 't');
INSERT INTO "public"."users" VALUES (536, 'April Edwards', 'edwardsapril@icloud.com', '035a7403ddae66d4c2b24f055ad56deb', 't');
INSERT INTO "public"."users" VALUES (537, 'Jacqueline Romero', 'jacqueliner@hotmail.com', '21fdaea9a407e0e1fe7b2ed5f57a992a', 't');
INSERT INTO "public"."users" VALUES (538, 'Jeff Gutierrez', 'jg20@icloud.com', 'b701f9afadb616bade98b7bb253d9a27', 'f');
INSERT INTO "public"."users" VALUES (539, 'Brian Medina', 'bmedina712@gmail.com', '1d3eb3bf41ac28d43f028b40a6d6e410', 'f');
INSERT INTO "public"."users" VALUES (540, 'Kathryn Rogers', 'rogerskathryn2009@hotmail.com', 'e2cbff01a8e716d82cb6884654240b8e', 'f');
INSERT INTO "public"."users" VALUES (541, 'Kimberly Flores', 'kimberlyflo@hotmail.com', '51267b78e6df907c827e64e779b17133', 't');
INSERT INTO "public"."users" VALUES (542, 'Alexander Webb', 'alexwebb@gmail.com', 'd4021a185dde73221384b419ee85dc48', 't');
INSERT INTO "public"."users" VALUES (543, 'Joanne White', 'joannewhite42@mail.com', 'a494e531cde133e21d189c70de3c3dfc', 't');
INSERT INTO "public"."users" VALUES (544, 'Rebecca Smith', 'rebes@yahoo.com', 'b77f813607d3d237f1aae7b15690e2b4', 'f');
INSERT INTO "public"."users" VALUES (545, 'Miguel Thomas', 'tmiguel@yahoo.com', 'a3249716b673903bd42034446f4235e1', 'f');
INSERT INTO "public"."users" VALUES (546, 'Christina Robertson', 'christinarobe@mail.com', 'd455e5ec756918322f4642a41f1b10b9', 'f');
INSERT INTO "public"."users" VALUES (547, 'Robin Carter', 'crobin@icloud.com', '081eaa335c0ecf3de583b331efc4bc71', 't');
INSERT INTO "public"."users" VALUES (548, 'Willie Jackson', 'wjac6@mail.com', '83a739ca58bf7b29811460fded9cb3ef', 'f');
INSERT INTO "public"."users" VALUES (549, 'Stephen Stevens', 'stevens1985@hotmail.com', 'c2fc0204738fbb44abc4452aaec873c3', 't');
INSERT INTO "public"."users" VALUES (550, 'Charles Price', 'pricec8@outlook.com', 'b3b897f30bde2c253a2a5dd7a20513c1', 't');
INSERT INTO "public"."users" VALUES (551, 'Thelma Richardson', 'thelmari1945@gmail.com', 'd543e470a5e06d44167320d900b17f89', 'f');
INSERT INTO "public"."users" VALUES (552, 'Pamela Smith', 'smithpamel@icloud.com', '8c3ae9b1c917d1f178c622d48b484f1f', 't');
INSERT INTO "public"."users" VALUES (553, 'Tammy Boyd', 'tammboy@hotmail.com', '794fbd4cd6cb085c9589d4b9ab33dec6', 'f');
INSERT INTO "public"."users" VALUES (554, 'Evelyn Payne', 'payneevelyn@outlook.com', '6b2148b98db18fc7adba5b6149c95e81', 't');
INSERT INTO "public"."users" VALUES (555, 'Jennifer Kelley', 'kelleyj@mail.com', 'dd7fa7fa803549bc870ef6b6d5eebab7', 't');
INSERT INTO "public"."users" VALUES (556, 'Sarah Bennett', 'sab@icloud.com', '3ca6cbcb8f16c1cedabe91ba0759b201', 't');
INSERT INTO "public"."users" VALUES (557, 'Ann Martin', 'maann3@outlook.com', '356a7613386bca3d54760cb433f3636a', 't');
INSERT INTO "public"."users" VALUES (558, 'Albert Mendez', 'ame@icloud.com', '2b127e21279338825446cd8830ec8b89', 'f');
INSERT INTO "public"."users" VALUES (559, 'Mike Taylor', 'miktaylor1@outlook.com', '1ecbf2b074f52dbac90a3babc3d80bba', 'f');
INSERT INTO "public"."users" VALUES (560, 'Justin Murray', 'murrj609@yahoo.com', '5015539a19e52fc2fcca6a1c6008445e', 't');
INSERT INTO "public"."users" VALUES (561, 'Ernest Jimenez', 'jimenezernes314@mail.com', 'bd7ed7602ce86fcef0078757faf95c58', 't');
INSERT INTO "public"."users" VALUES (562, 'Frank Henderson', 'frank59@hotmail.com', 'c60e288154ecd7403e4f035aa8a7d384', 't');
INSERT INTO "public"."users" VALUES (563, 'Randy Sanchez', 'rs6@yahoo.com', 'c2199dd25d2db3f1c1d1e789ad6ed2b3', 't');
INSERT INTO "public"."users" VALUES (564, 'Kim Dixon', 'kim7@icloud.com', '87f3f63b2222464445b24bad96d8e6a0', 'f');
INSERT INTO "public"."users" VALUES (565, 'Peter Nelson', 'nelson03@gmail.com', 'af80745844a1f7ba4e2529126c173392', 'f');
INSERT INTO "public"."users" VALUES (566, 'Marcus Gonzales', 'gonzalesmarcu@gmail.com', '1638a9118f9060d72a0353137f2546ab', 't');
INSERT INTO "public"."users" VALUES (567, 'Curtis Garcia', 'cgarcia59@gmail.com', 'd9d7e0fcabd9eb32058cc05fc83fcb11', 'f');
INSERT INTO "public"."users" VALUES (568, 'Bruce White', 'bwhi8@outlook.com', '940850f443207a409d38bdb4a5f62d79', 'f');
INSERT INTO "public"."users" VALUES (569, 'Leroy Moore', 'lermoore2@hotmail.com', 'd4f9884ae7ed9bc9c2a671792e730054', 't');
INSERT INTO "public"."users" VALUES (570, 'Douglas Moreno', 'moreno6@icloud.com', '21c2b7066e99b5e118f6f6d2b2ddb2cb', 'f');
INSERT INTO "public"."users" VALUES (571, 'Debbie Henry', 'henrydebbie8@gmail.com', 'fa031c1af65c4b8f0afa6d9a1f999dd9', 't');
INSERT INTO "public"."users" VALUES (572, 'Jeremy Romero', 'romerojeremy@yahoo.com', '465c6ddf5a3ef22506effd8bbba8b0b2', 'f');
INSERT INTO "public"."users" VALUES (573, 'Sarah Coleman', 'sc3@icloud.com', 'a1edb1c9c522bbd9141517ea68a5c702', 't');
INSERT INTO "public"."users" VALUES (574, 'Ethel Stephens', 'stephens6@hotmail.com', '2e6112224787abb9d709beb91cdd18a3', 't');
INSERT INTO "public"."users" VALUES (575, 'Evelyn Moore', 'moore324@gmail.com', 'b4f3b7be27cde67547c5e233306ab0b3', 't');
INSERT INTO "public"."users" VALUES (576, 'Joan Munoz', 'jm2013@outlook.com', '9a9b2cb49cbee135149320db21e37c70', 'f');
INSERT INTO "public"."users" VALUES (577, 'Marvin Ward', 'wardmarvin4@gmail.com', '9a549221c3d930c98964e4bc64ce1cca', 't');
INSERT INTO "public"."users" VALUES (578, 'Ricky Miller', 'rickymiller@mail.com', '05038f02806ab1e924c22a4077e74768', 'f');
INSERT INTO "public"."users" VALUES (579, 'Elaine Hicks', 'hickse1978@icloud.com', '7d6dcaf00f77c849169f036b305006fb', 'f');
INSERT INTO "public"."users" VALUES (580, 'Peggy Daniels', 'peggy7@gmail.com', 'ac22d35648daf92166573a26ff713ded', 't');
INSERT INTO "public"."users" VALUES (581, 'Dawn Rice', 'rdaw7@icloud.com', 'bcc2ea7025e3dc91f75275609b75acef', 't');
INSERT INTO "public"."users" VALUES (582, 'Jane Evans', 'jevans613@gmail.com', '418d9f5026bbcb9c282f8916f45e215e', 'f');
INSERT INTO "public"."users" VALUES (583, 'Betty Hamilton', 'bettyhamilton4@gmail.com', '8352fbac38c640592f58455afe7241f9', 't');
INSERT INTO "public"."users" VALUES (584, 'Ethel Castillo', 'castiethel6@outlook.com', 'c59a9f37aee40bdc8fdd2d0a67109954', 't');
INSERT INTO "public"."users" VALUES (585, 'Denise Jones', 'denjo@gmail.com', '47e27e6fac851b428b3ab4d33ae4f630', 't');
INSERT INTO "public"."users" VALUES (586, 'Teresa Stephens', 'stephenstere@icloud.com', '0fe48fed5b71d5708953aea4c6481c73', 't');
INSERT INTO "public"."users" VALUES (587, 'Mike Guzman', 'mikguzm7@hotmail.com', '69f1edea2c361f4646700e5623b60b45', 'f');
INSERT INTO "public"."users" VALUES (588, 'Betty Warren', 'warrenbet@mail.com', '90e5918180eb1e5a1c161dcaece71824', 'f');
INSERT INTO "public"."users" VALUES (589, 'April Diaz', 'diaza201@yahoo.com', 'c3c3d525cf2068deb8df4db08a4d4a2e', 'f');
INSERT INTO "public"."users" VALUES (590, 'Kelly West', 'west63@yahoo.com', 'ce77eafe5b38f45bc549acc209212d48', 'f');
INSERT INTO "public"."users" VALUES (591, 'Anita Thomas', 'thoanita@icloud.com', '637ce26eab2b6041035f7776a1b8fbb5', 't');
INSERT INTO "public"."users" VALUES (592, 'Glenn Moore', 'moorglenn@outlook.com', 'a01f16569cf6a11f78bd210094f0fc6a', 't');
INSERT INTO "public"."users" VALUES (593, 'Carl Peterson', 'petersonca@gmail.com', 'fef23e09e8ec3fa6afcf41b7e471e0b4', 'f');
INSERT INTO "public"."users" VALUES (594, 'Frederick Fox', 'fredf3@mail.com', '4328c5b48f512849c3d426989ef3ac59', 'f');
INSERT INTO "public"."users" VALUES (595, 'Sylvia Weaver', 'sylviwea@gmail.com', 'cd42661e5ab37405110a2b184b3cbae2', 'f');
INSERT INTO "public"."users" VALUES (596, 'Chris Stone', 'schris@mail.com', '603aa051ec9a4edd3ffbfe4a6440f711', 't');
INSERT INTO "public"."users" VALUES (597, 'Chris Baker', 'bchris@outlook.com', '5746fe2f20d8b42ad1ed366ebadcb7ec', 'f');
INSERT INTO "public"."users" VALUES (598, 'Tammy Johnson', 'johnson1@gmail.com', '1df7a54c68a0bdec90145bad6022d3c4', 'f');
INSERT INTO "public"."users" VALUES (599, 'Catherine Aguilar', 'cagui@gmail.com', 'fac6cd30ee319ef0167bfa8b1d5625f2', 't');
INSERT INTO "public"."users" VALUES (600, 'Rhonda Woods', 'woodsrhonda09@outlook.com', '5e1c870763d9a09776f8bbccf1681a8f', 'f');
INSERT INTO "public"."users" VALUES (601, 'Jacob Wells', 'jwe@gmail.com', '092a71e7c222b1a9c5c6e8cb01404a29', 't');
INSERT INTO "public"."users" VALUES (602, 'Charles Parker', 'parker5@mail.com', '58c9cb029dd055615c8cac179cb08a2e', 'f');
INSERT INTO "public"."users" VALUES (603, 'Jacqueline Meyer', 'jacqueline1201@icloud.com', 'a35269a2bfac3444d3efb851cf635718', 'f');
INSERT INTO "public"."users" VALUES (604, 'Todd James', 'toddjames502@outlook.com', '7259458d937fd805ab639e3695940b8d', 'f');
INSERT INTO "public"."users" VALUES (605, 'Marjorie Jenkins', 'jenkmarj@icloud.com', '401d744bb5d1cc4cedfad1397f90d57d', 't');
INSERT INTO "public"."users" VALUES (606, 'Nathan Watson', 'wanathan2004@hotmail.com', 'a8fc3629434e9078a4de00f7e65bc470', 'f');
INSERT INTO "public"."users" VALUES (607, 'Martin Martinez', 'martinezmartin10@yahoo.com', 'dd82831c01aeeb1cb40f17e5d583165c', 'f');
INSERT INTO "public"."users" VALUES (608, 'Benjamin Torres', 'benjamintor1974@icloud.com', '5480fc7f716057ff6a3cf560c573b0f0', 'f');
INSERT INTO "public"."users" VALUES (609, 'Annie Dixon', 'dixon10@hotmail.com', 'f1f4619f475187c252e9191c1d7243c7', 'f');
INSERT INTO "public"."users" VALUES (610, 'Roy Adams', 'adaroy@yahoo.com', '91412f734b72699ca6bf480b52bb92ae', 't');
INSERT INTO "public"."users" VALUES (611, 'Paul Nichols', 'paul6@gmail.com', 'bc6ee3635c7bb2cd7c85b0cf86034036', 'f');
INSERT INTO "public"."users" VALUES (612, 'Wanda Hernandez', 'hernwanda@gmail.com', '57834ad334c99fc6c476cab5064cc650', 'f');
INSERT INTO "public"."users" VALUES (613, 'Maria Sanchez', 'smaria@outlook.com', '2a2780f8feba54ba5e1de51679f3a960', 'f');
INSERT INTO "public"."users" VALUES (614, 'Rhonda Miller', 'millerrhonda105@outlook.com', 'ea8bfa6ba080fda955cf36df133055b1', 't');
INSERT INTO "public"."users" VALUES (615, 'Allen Brown', 'allenbr@yahoo.com', 'c90533ce95001d788512261095a3dbac', 'f');
INSERT INTO "public"."users" VALUES (616, 'Earl Edwards', 'earledwards@yahoo.com', '0ea952c83a5d1c36aa3c991bdd293885', 'f');
INSERT INTO "public"."users" VALUES (617, 'Danny Freeman', 'dannfreem906@mail.com', '13f6283d8008ff320cbfa9b3c0bdc49c', 't');
INSERT INTO "public"."users" VALUES (618, 'Clara Murphy', 'murpclara@yahoo.com', 'bc399eb098644c9d862bce959e755fa3', 't');
INSERT INTO "public"."users" VALUES (619, 'Helen Sullivan', 'hels@outlook.com', 'ae750af12849f893c7c6824362276c56', 't');
INSERT INTO "public"."users" VALUES (620, 'Clarence Tucker', 'tuckerclar@yahoo.com', 'd064ecf2f99a2cf24d09006e9e78409e', 'f');
INSERT INTO "public"."users" VALUES (621, 'Danielle Wagner', 'daniew@outlook.com', '52f70829e0116f8a26d15deab17305ba', 't');
INSERT INTO "public"."users" VALUES (622, 'Amy Morales', 'amymorales@outlook.com', 'bbfffb5d378605907ba344e792832e75', 't');
INSERT INTO "public"."users" VALUES (623, 'Miguel Wallace', 'miguel316@gmail.com', '2e643d40b40a5023a8e18833544c7a17', 't');
INSERT INTO "public"."users" VALUES (624, 'Jack Gibson', 'jgib5@hotmail.com', '187286f5c09863b8feeacb77d2e5f0ac', 't');
INSERT INTO "public"."users" VALUES (625, 'Marilyn Patterson', 'pattemarilyn@icloud.com', 'cae59667af8ed69a8388435678f6a347', 't');
INSERT INTO "public"."users" VALUES (626, 'Roger Phillips', 'pro@icloud.com', '80e8a9708eb049158f97bdfca5f82f06', 'f');
INSERT INTO "public"."users" VALUES (627, 'Victoria Kelley', 'victoria1002@yahoo.com', '646bb34c89246df9f5dcd0830a1a8956', 'f');
INSERT INTO "public"."users" VALUES (628, 'Lee Vargas', 'vlee@icloud.com', '89135f53a1c2c749f196dc1ba04ea2f0', 't');
INSERT INTO "public"."users" VALUES (629, 'George Olson', 'olsong@outlook.com', '5dcecb99654a533048f91ea947885979', 't');
INSERT INTO "public"."users" VALUES (630, 'Lawrence Richardson', 'lawrr@gmail.com', 'a9553b37afc8277e583e0cc8705e9b8e', 'f');
INSERT INTO "public"."users" VALUES (631, 'Kathleen Woods', 'kathlwo@hotmail.com', '9e638b283fe41163def12065b76b4758', 'f');
INSERT INTO "public"."users" VALUES (632, 'Steven Hill', 'histe@icloud.com', '74349db0233695b0050201aa050ec63b', 'f');
INSERT INTO "public"."users" VALUES (633, 'John Stewart', 'johstewart@outlook.com', 'eb131cd5ca16e4da13927a92ed142011', 'f');
INSERT INTO "public"."users" VALUES (634, 'Billy Phillips', 'phb@gmail.com', 'b0e56cc7d27c27388a77fcb1840d0048', 'f');
INSERT INTO "public"."users" VALUES (635, 'Valerie Sullivan', 'sullivan4@icloud.com', '97d969172478ae332b71209712656272', 'f');
INSERT INTO "public"."users" VALUES (636, 'Ann Wallace', 'annwallace@yahoo.com', '886ac2e43a71acf8aff60f6e91c49c89', 't');
INSERT INTO "public"."users" VALUES (637, 'Clifford Meyer', 'clim6@hotmail.com', '441e484442fd98449428e0a27894f499', 'f');
INSERT INTO "public"."users" VALUES (638, 'Julia Nguyen', 'jnguyen8@gmail.com', '09bca14916e25dff0b7fc4bf8363e98a', 't');
INSERT INTO "public"."users" VALUES (639, 'Kathleen Dunn', 'kadunn83@icloud.com', '05e1d83535e8065eb0014319d2de05ae', 'f');
INSERT INTO "public"."users" VALUES (640, 'Jason Schmidt', 'jasonschmidt902@yahoo.com', '430d709ce8b692d4e2e9bfcee1ae080e', 'f');
INSERT INTO "public"."users" VALUES (641, 'Paula Wallace', 'pawal@gmail.com', '2a21f322bea1f45b9cac8799091eb364', 'f');
INSERT INTO "public"."users" VALUES (642, 'Danielle Hayes', 'hayes8@icloud.com', '1414297d478237144916e407d78e04bf', 't');
INSERT INTO "public"."users" VALUES (643, 'Leslie Perry', 'leslieperry@yahoo.com', 'dc0466b3c0a35fe45b1fc3ca43779973', 'f');
INSERT INTO "public"."users" VALUES (644, 'Helen Tucker', 'helent@outlook.com', '3bbaa018feb3687a11d5d8ec333148fb', 'f');
INSERT INTO "public"."users" VALUES (645, 'Juanita Hayes', 'juanita6@outlook.com', '094550f38158f7d01713ef44cf8b6e21', 't');
INSERT INTO "public"."users" VALUES (646, 'Jonathan Jackson', 'jonathan816@icloud.com', '174c523405956a8836762657e272fd6b', 't');
INSERT INTO "public"."users" VALUES (647, 'Ashley Hughes', 'hashle86@icloud.com', 'a767a7d40cdcb1e6c2201bafbb086b91', 'f');
INSERT INTO "public"."users" VALUES (648, 'Lisa Brooks', 'brooksl@yahoo.com', 'a8b9efb7e295a7f96c54c30f719e023b', 't');
INSERT INTO "public"."users" VALUES (649, 'Brian Brown', 'bbria@gmail.com', '6b9279b0bd39f29b32f43f8f6691c2db', 't');
INSERT INTO "public"."users" VALUES (650, 'Leonard James', 'jamesleon3@outlook.com', 'c0f1d1828639da0a04f0e75302e51899', 't');
INSERT INTO "public"."users" VALUES (651, 'Barbara Adams', 'abarba@mail.com', 'dcb6dee3ff4bd4bd4a1be2b76a1cadcf', 'f');
INSERT INTO "public"."users" VALUES (652, 'Steve Stone', 'ss55@hotmail.com', '553a625297efc4ad7c66f37eed0c703f', 't');
INSERT INTO "public"."users" VALUES (653, 'Denise Reynolds', 'denisereynolds@hotmail.com', '9fa55e8962b04620af89bf48c37a07b5', 'f');
INSERT INTO "public"."users" VALUES (654, 'Ann Woods', 'woods3@hotmail.com', '1dad947fa4b9e8c8735003073e539a39', 'f');
INSERT INTO "public"."users" VALUES (655, 'Philip Rice', 'riph06@icloud.com', '7b676dafbffb55e8be4fd9e130cc390a', 't');
INSERT INTO "public"."users" VALUES (656, 'Doris Collins', 'collinsd@hotmail.com', '3a7c5d91ac8ab90f67c076b4916c4c4f', 'f');
INSERT INTO "public"."users" VALUES (657, 'Todd West', 'todd7@hotmail.com', '3845f1997f98555fdc3dcdfbc670d617', 'f');
INSERT INTO "public"."users" VALUES (658, 'Carrie Nguyen', 'ngucarri@hotmail.com', 'ec58e1516b6a5cc8db9115282e0db6bd', 'f');
INSERT INTO "public"."users" VALUES (659, 'Brenda Stevens', 'stbr@gmail.com', '11c3ced217aa0c293320adcada451fe7', 't');
INSERT INTO "public"."users" VALUES (660, 'Jamie Wallace', 'walj@icloud.com', '6aeda289c849bf8c9cff6a75d4551f19', 't');
INSERT INTO "public"."users" VALUES (661, 'Stanley Snyder', 'snyderstanley901@gmail.com', 'd0e3bb3acca33e573fbc4e9dd1bd3c4e', 't');
INSERT INTO "public"."users" VALUES (662, 'Ruth Payne', 'pr216@hotmail.com', 'fb26a4fbaff1f4dc508ab7816788e907', 'f');
INSERT INTO "public"."users" VALUES (663, 'Bryan Mills', 'bryan48@hotmail.com', 'ee7ffe318294e5b04bec57399599120c', 't');
INSERT INTO "public"."users" VALUES (664, 'Nancy Morales', 'mnancy@icloud.com', 'abed69ae9efbdd8958d954edddc3f41d', 'f');
INSERT INTO "public"."users" VALUES (665, 'Maria Morgan', 'maria2020@hotmail.com', '9490fe963576702afb4202ec662a879b', 'f');
INSERT INTO "public"."users" VALUES (666, 'Michael King', 'michking5@gmail.com', '65bc6b9f4e0b826041d1a7acd764bc3f', 'f');
INSERT INTO "public"."users" VALUES (667, 'Kyle Davis', 'kyledavi@icloud.com', '6cc687dd3a0dd2e031aa618be63acf35', 't');
INSERT INTO "public"."users" VALUES (668, 'Alfred Hill', 'alfrhi427@outlook.com', 'f7774eb3b602cc207fca02a0bd15b824', 'f');
INSERT INTO "public"."users" VALUES (669, 'Alice Porter', 'aliceporte@gmail.com', '229ba030e12f1b5c10fefb97e840d40a', 'f');
INSERT INTO "public"."users" VALUES (670, 'Juanita Burns', 'burnsjuanita@gmail.com', '4ebf3215e0eae8f7fe66c023df2cf5f4', 'f');
INSERT INTO "public"."users" VALUES (671, 'Katherine Marshall', 'marskatherine6@outlook.com', 'b1b541014101b1bc7fd7411cb4f6e368', 'f');
INSERT INTO "public"."users" VALUES (672, 'Keith Medina', 'km56@mail.com', '5263531b937eeb72aae3f152b07fce32', 'f');
INSERT INTO "public"."users" VALUES (673, 'Peter Hunter', 'huntepe@gmail.com', 'bfedf7d3248c5b14cb87fa37bd9ae044', 'f');
INSERT INTO "public"."users" VALUES (674, 'Kyle Patterson', 'kylepatterson@gmail.com', 'c9e6438ad2a1660201d78cb73390ba39', 'f');
INSERT INTO "public"."users" VALUES (675, 'Carolyn Ward', 'cawar@mail.com', '5b6812d443a4b45f6374d041c56241d0', 'f');
INSERT INTO "public"."users" VALUES (676, 'Katherine Meyer', 'meykathe@icloud.com', 'd1eafbb9e22714e0b06167125f2e5946', 't');
INSERT INTO "public"."users" VALUES (677, 'Brian Gonzalez', 'gonzb@mail.com', '0b5f0a777c743b48eaa717056a86bae0', 'f');
INSERT INTO "public"."users" VALUES (678, 'Bryan Lewis', 'brle@hotmail.com', 'b226582ea6de94a39750c9b5950e23eb', 'f');
INSERT INTO "public"."users" VALUES (679, 'Kyle Alvarez', 'kalvarez@gmail.com', '368bb719cfe208146428e977a238d16b', 't');
INSERT INTO "public"."users" VALUES (680, 'Virginia Tucker', 'virgitu114@yahoo.com', '7be9c199879e2dbef70c89de396768fa', 't');
INSERT INTO "public"."users" VALUES (681, 'Jessica Holmes', 'jessicaholm223@gmail.com', '17b0bfdd2fd2c4352cd107bfe074d3a5', 't');
INSERT INTO "public"."users" VALUES (682, 'Leonard Herrera', 'leoherre@gmail.com', '00080d1be7a78662f383526a569201d0', 't');
INSERT INTO "public"."users" VALUES (683, 'Charles Parker', 'charlpar@gmail.com', '64c6d6269024c3d2d7b50e4e3e83173c', 't');
INSERT INTO "public"."users" VALUES (684, 'Mark Snyder', 'masnyder2006@gmail.com', '8b20b6068b9248c17a68115324992d0f', 'f');
INSERT INTO "public"."users" VALUES (685, 'Barbara Nelson', 'bnelso94@icloud.com', '590500cfa59d1aa85ec979c68908c379', 't');
INSERT INTO "public"."users" VALUES (686, 'Frances James', 'francesjames619@mail.com', 'f604f339c96a876d7eb5aa64a9a96a68', 't');
INSERT INTO "public"."users" VALUES (687, 'Adam Hernandez', 'adamhernandez@gmail.com', 'e0a1f9ba8aad94d980769f90fbbfd8cb', 't');
INSERT INTO "public"."users" VALUES (688, 'Dawn Fox', 'dawnfo84@icloud.com', '031ae2e5d3eb46fbe91ba536fe69cbb3', 't');
INSERT INTO "public"."users" VALUES (689, 'Mike Moore', 'mimoore5@icloud.com', 'e26e399d8192a6a344949cdb27ba27ac', 't');
INSERT INTO "public"."users" VALUES (690, 'Julie Alvarez', 'alvarezj@outlook.com', 'f3025ff5065dde2426db0acefa887bb9', 't');
INSERT INTO "public"."users" VALUES (691, 'Maria Dunn', 'maria1979@mail.com', '0a52425adb00788b98f118412053fe84', 't');
INSERT INTO "public"."users" VALUES (692, 'Kelly Garcia', 'keg@hotmail.com', 'e663b3faff9b4709643c14d1fc23379c', 'f');
INSERT INTO "public"."users" VALUES (693, 'Brian Diaz', 'brdiaz6@gmail.com', '48f02bb219b65244e1bfbf15ff6b457e', 't');
INSERT INTO "public"."users" VALUES (694, 'Sandra Murray', 'sandm15@gmail.com', '268f238d452b1e2fee981de75d60db43', 'f');
INSERT INTO "public"."users" VALUES (695, 'Norman Medina', 'norman10@gmail.com', 'aa89784d589eee391acadf229abacd0c', 't');
INSERT INTO "public"."users" VALUES (696, 'Jimmy Payne', 'jpayne@icloud.com', '4210c33889e600f9550501b789e38b3d', 't');
INSERT INTO "public"."users" VALUES (697, 'Bonnie Patel', 'patelbonnie@mail.com', 'a34c4d267748b05671611f26de70ada5', 'f');
INSERT INTO "public"."users" VALUES (698, 'Joan Barnes', 'joab@gmail.com', 'aaf4222dabcb2edaa760cc092d731ab9', 'f');
INSERT INTO "public"."users" VALUES (699, 'Mildred Palmer', 'mildredpal@gmail.com', 'e120b5ec89cb8167ce5bbc898b78641d', 't');
INSERT INTO "public"."users" VALUES (700, 'Theresa Gonzales', 'gonzt@outlook.com', '2f499095b7696197ee741c59073bb0a7', 't');
INSERT INTO "public"."users" VALUES (701, 'William Rose', 'williamrose@gmail.com', '4b6e2f1c402827da4cd4c403fa2da5b8', 't');
INSERT INTO "public"."users" VALUES (702, 'Bobby Coleman', 'coleman110@icloud.com', '2743bfdd2d534d7af37889b11b692bf9', 'f');
INSERT INTO "public"."users" VALUES (703, 'Bruce Bell', 'brucebell@mail.com', '3ba5b2485901c014cd2a8f4d25f04c34', 'f');
INSERT INTO "public"."users" VALUES (704, 'Thelma Mendez', 'thelmame5@gmail.com', '20a47313c6cbc9fdfa542d52b9c23f7c', 't');
INSERT INTO "public"."users" VALUES (705, 'Betty Ellis', 'ellis127@icloud.com', '43ed3ee4407de9cd23e4521f90047cbf', 'f');
INSERT INTO "public"."users" VALUES (706, 'Anthony Freeman', 'anthony71@icloud.com', '6373a5b52015c162f64a7501bd2475c6', 'f');
INSERT INTO "public"."users" VALUES (707, 'Amber Coleman', 'amberc9@icloud.com', '4dd560a2b2ee439e4103be3c0b26f3a1', 't');
INSERT INTO "public"."users" VALUES (708, 'Emma Long', 'lemma75@gmail.com', 'dc9ffac2b7ad6fce0f7fc926bad7917d', 't');
INSERT INTO "public"."users" VALUES (709, 'Anna Cook', 'coan@gmail.com', '47dfa3c76bf528ae519d99fba4255e4e', 'f');
INSERT INTO "public"."users" VALUES (710, 'Elaine Cruz', 'elainecr1@outlook.com', 'ce68c24cf43289008079165a8ff604d5', 't');
INSERT INTO "public"."users" VALUES (711, 'Cheryl Snyder', 'snyder09@icloud.com', '38acbb0043decbb2d5a3b9d97e349d54', 'f');
INSERT INTO "public"."users" VALUES (712, 'Mark Burns', 'bmark1@hotmail.com', '1c1ca866a8dd8521ae117beca5390c2c', 'f');
INSERT INTO "public"."users" VALUES (713, 'Christine Hall', 'hchristine@gmail.com', '98e29b06412a336faaf4d23d3a2b5253', 'f');
INSERT INTO "public"."users" VALUES (714, 'Tony Patel', 'patel56@gmail.com', 'c70e24be46e55802b7ac523d3aab86c4', 'f');
INSERT INTO "public"."users" VALUES (715, 'Robin Graham', 'graharobin@outlook.com', '4ddac44917159cae7166303bdcb7e760', 't');
INSERT INTO "public"."users" VALUES (716, 'Irene Gray', 'grayi@yahoo.com', '4481c19f401692e30fad59817e8edd20', 't');
INSERT INTO "public"."users" VALUES (717, 'Scott Baker', 'bakerscott@outlook.com', '02bec45a49eb84e4126bacc2c7c136ff', 'f');
INSERT INTO "public"."users" VALUES (718, 'Melvin Chavez', 'melvc@icloud.com', '4bb8862e079e6223518557de3aaf586e', 'f');
INSERT INTO "public"."users" VALUES (719, 'Shannon Fernandez', 'fshannon@mail.com', '7cfb590658f731fd8dee7a147f90f871', 'f');
INSERT INTO "public"."users" VALUES (720, 'Carl Webb', 'webbc@gmail.com', '7deb86b9bd00c35639052be9596dc406', 'f');
INSERT INTO "public"."users" VALUES (721, 'Theodore Gordon', 'theodoregor@gmail.com', '4255b37fd022df45b407d624704d5f35', 'f');
INSERT INTO "public"."users" VALUES (722, 'Andrew Scott', 'andres@icloud.com', 'f6179d735eff65c374b751acaca1ec41', 't');
INSERT INTO "public"."users" VALUES (723, 'Catherine Stone', 'catherine1010@icloud.com', '88e75cb9a6d45a129863707feebfe6a6', 'f');
INSERT INTO "public"."users" VALUES (724, 'Ethel Jenkins', 'jenkins5@icloud.com', '9db15f82b89081866f7b07c208f8c904', 'f');
INSERT INTO "public"."users" VALUES (725, 'Carrie Ford', 'carriefo413@gmail.com', '0a96b96cf53f7dffc06f8a5a806507c6', 't');
INSERT INTO "public"."users" VALUES (726, 'Monica Ford', 'formonica@outlook.com', 'c78c84a324760f0a11248bcdc67980e8', 't');
INSERT INTO "public"."users" VALUES (727, 'Denise James', 'denisejames@mail.com', '299762f250666e78159feafc9dfa80ab', 't');
INSERT INTO "public"."users" VALUES (728, 'Brian Jackson', 'jacksonbrian@gmail.com', 'ce7529a33164aa29f290756c2e51e813', 't');
INSERT INTO "public"."users" VALUES (729, 'Karen Kelley', 'karen1@yahoo.com', 'dc5126afc7be8485de88de3cae54e6bb', 't');
INSERT INTO "public"."users" VALUES (730, 'Carmen Rodriguez', 'rodriguezc@icloud.com', '7885ff3bbaad1176c83ffea14c8283a2', 't');
INSERT INTO "public"."users" VALUES (731, 'Annie Hawkins', 'anniehawkins@gmail.com', '45e920976acb210933e5779d9806f86a', 't');
INSERT INTO "public"."users" VALUES (732, 'Chris Stevens', 'chrisstevens308@yahoo.com', 'ac8f03def0f0633c72a2624c14707b1f', 'f');
INSERT INTO "public"."users" VALUES (733, 'Norma Walker', 'walkernorm@outlook.com', 'adca2c97c483d896ae1a490836b3af72', 't');
INSERT INTO "public"."users" VALUES (734, 'Douglas Vasquez', 'dvasquez811@yahoo.com', '6bfe25bcece0090deb81bd5e19add4b2', 't');
INSERT INTO "public"."users" VALUES (735, 'Tammy Cole', 'cole5@outlook.com', 'c2ac7049846db2843efd42dd7bf7ea62', 'f');
INSERT INTO "public"."users" VALUES (736, 'Eugene Long', 'long814@outlook.com', 'd98480f3357ac27e7e47f51a39d28053', 'f');
INSERT INTO "public"."users" VALUES (737, 'Stephanie Adams', 'adamstep@yahoo.com', '7cf7b60488792abd73306112bb8617b9', 't');
INSERT INTO "public"."users" VALUES (738, 'Antonio Rice', 'arice@mail.com', '9223fc726f806f1bae3d11e7ac942c2b', 'f');
INSERT INTO "public"."users" VALUES (739, 'Earl Patterson', 'earlpatterson5@outlook.com', '4315ebe9bba610720cec0e328c38cd41', 't');
INSERT INTO "public"."users" VALUES (740, 'Jeremy Young', 'jyou@mail.com', '626c42e8f50a38d68f9e067d75bc82ed', 'f');
INSERT INTO "public"."users" VALUES (741, 'James Woods', 'woodsj1@gmail.com', '95564d9faf2d170cec36d44f393f1550', 'f');
INSERT INTO "public"."users" VALUES (742, 'Curtis Martinez', 'martinez913@gmail.com', '8062fd5c64ac8bab1785047dbbbd272f', 't');
INSERT INTO "public"."users" VALUES (743, 'Ronald Palmer', 'ronaldpalmer5@hotmail.com', '36338c9da0908239fe74f1ff87f7120f', 't');
INSERT INTO "public"."users" VALUES (744, 'Lois Shaw', 'shaw1130@mail.com', '1cdcbe80e6db55bf7d607dd40f468a01', 't');
INSERT INTO "public"."users" VALUES (745, 'Christopher Webb', 'christopherwebb@gmail.com', 'cf83cb2f4d992fc51a1f01c2d3969d39', 't');
INSERT INTO "public"."users" VALUES (746, 'Virginia Kim', 'vikim@icloud.com', '075f69c34542475aaa84cca179602c2d', 't');
INSERT INTO "public"."users" VALUES (747, 'Travis Weaver', 'weavertravis00@gmail.com', 'b5e5f2bddf7760031bbf567c3c28726c', 'f');
INSERT INTO "public"."users" VALUES (748, 'Andrea Ward', 'andrea5@icloud.com', '7799be123955d9afa760d32921ca0230', 't');
INSERT INTO "public"."users" VALUES (749, 'Randy Wright', 'wrandy@icloud.com', '4cd93b3f3b1ada4b151050f60e03b84f', 't');
INSERT INTO "public"."users" VALUES (750, 'Jason Jackson', 'jaj@hotmail.com', '2876c46416e4ebbcafb91af7cbc32bbc', 't');
INSERT INTO "public"."users" VALUES (751, 'Marjorie Russell', 'russellmarjorie@icloud.com', '5a6c10725ff3ac6a1a4203e426ce1752', 't');
INSERT INTO "public"."users" VALUES (752, 'Christopher Palmer', 'palmerchristopher@outlook.com', 'd917655436751187f72c5860b43b3eaa', 't');
INSERT INTO "public"."users" VALUES (753, 'Jose Simmons', 'simj@mail.com', '5ae924ed36f6cf149e8b977cbd16afb9', 't');
INSERT INTO "public"."users" VALUES (754, 'Timothy Ward', 'tward97@outlook.com', 'b7274eb76698207e7d76fcb6f00ee074', 'f');
INSERT INTO "public"."users" VALUES (755, 'Mary Ramirez', 'ramirezm@mail.com', 'b492621d3f97e8302c8efac42242be69', 't');
INSERT INTO "public"."users" VALUES (756, 'Dorothy Ellis', 'ellisd@yahoo.com', 'a9f738b8fa99a3395dd10d9cb7dbd1b2', 'f');
INSERT INTO "public"."users" VALUES (757, 'Rosa Wallace', 'rosawallace@gmail.com', '0c571e5cd61a3e6d3f5970cb73a8eff6', 't');
INSERT INTO "public"."users" VALUES (758, 'Marcus Coleman', 'macoleman@icloud.com', '3c36474a070ed8d89bf1b9bebc967b39', 'f');
INSERT INTO "public"."users" VALUES (759, 'Jack Gutierrez', 'jackgutierrez@hotmail.com', '2995e8366f1270858300c93ce75c8304', 't');
INSERT INTO "public"."users" VALUES (760, 'Marjorie Ryan', 'marya712@gmail.com', 'cc63eeb44786587dba8db85ddbd47658', 't');
INSERT INTO "public"."users" VALUES (761, 'Sandra Tran', 'transandra01@outlook.com', 'da69c262fe6e194a2c2a92bec0760696', 't');
INSERT INTO "public"."users" VALUES (762, 'Scott Simpson', 'simpsonsco1007@mail.com', '4f158b05aee73d944f7a333b9e8e4171', 't');
INSERT INTO "public"."users" VALUES (763, 'Joanne Stevens', 'joannste@mail.com', '6f6aa84ad1906db5ee1382d3464c1a2f', 'f');
INSERT INTO "public"."users" VALUES (764, 'Kim Cruz', 'cruzkim@yahoo.com', '18da19a3a7d1e455493aef2151ce8a0b', 'f');
INSERT INTO "public"."users" VALUES (765, 'Arthur Lopez', 'artlopez16@icloud.com', 'e12c6222087b27506c708dda9d96c6c7', 't');
INSERT INTO "public"."users" VALUES (766, 'William Stone', 'stonewilliam@icloud.com', '5c55273bcca5eb8401a7330beca52052', 'f');
INSERT INTO "public"."users" VALUES (767, 'Louis Evans', 'evans9@gmail.com', 'c274503771807cf4134f305505b101ce', 't');
INSERT INTO "public"."users" VALUES (768, 'Clarence Schmidt', 'schmidtcla@yahoo.com', 'f598fb6709a64a3613dd46aa2649d56b', 't');
INSERT INTO "public"."users" VALUES (769, 'Maria Watson', 'mwa5@gmail.com', '9d8724dd8336b1638902335763c0378d', 'f');
INSERT INTO "public"."users" VALUES (770, 'Chad Mcdonald', 'mcdonald1109@gmail.com', '18f7bb3fc3bbb5e4107db2bde909a0ef', 'f');
INSERT INTO "public"."users" VALUES (771, 'Christine Marshall', 'christine328@gmail.com', 'b783f7a1e615303735c6337427882ace', 'f');
INSERT INTO "public"."users" VALUES (772, 'Louise Snyder', 'snyloui7@outlook.com', 'e5b57ee1940d32d2c530536c8609339d', 't');
INSERT INTO "public"."users" VALUES (773, 'Jack Gonzalez', 'gonzalez90@icloud.com', '5efa46161151f3ee0960b10285ef97da', 'f');
INSERT INTO "public"."users" VALUES (774, 'Janice Carter', 'janic112@hotmail.com', '73a95a1a81a044334da52c8d96c1448a', 't');
INSERT INTO "public"."users" VALUES (775, 'Joan Munoz', 'mjo@yahoo.com', '66d9baaab930cc6159ad723661c10358', 't');
INSERT INTO "public"."users" VALUES (776, 'Diana Vasquez', 'vasquezdiana9@gmail.com', '2f33e59cf75341c4412939f69b9cb586', 'f');
INSERT INTO "public"."users" VALUES (777, 'Jeremy Gomez', 'gomj@hotmail.com', '0d4b69509e875c99ee521d44df6b93c8', 't');
INSERT INTO "public"."users" VALUES (778, 'Sheila Simpson', 'simpson7@gmail.com', 'eb0ed3f04a9a688a477df753d420265a', 't');
INSERT INTO "public"."users" VALUES (779, 'Gary Freeman', 'freemang@mail.com', '3f4fd74134cd08d2dadf07a12b211ed9', 'f');
INSERT INTO "public"."users" VALUES (780, 'Jane Moreno', 'morenjane@hotmail.com', 'b4f96261f309f881049abc3fad99d16b', 't');
INSERT INTO "public"."users" VALUES (781, 'Katherine Burns', 'burnska66@outlook.com', '409e74736d3f5669e5ee31c29f856e53', 't');
INSERT INTO "public"."users" VALUES (782, 'Shirley Thomas', 'sthomas@mail.com', '211801feb2cbf5be785f2954e495fdfe', 't');
INSERT INTO "public"."users" VALUES (783, 'Kenneth Wallace', 'wallacekenneth5@outlook.com', '92b774e02945eb5a171c208ef2281f21', 'f');
INSERT INTO "public"."users" VALUES (784, 'Miguel Woods', 'miguelwoods@outlook.com', '2183f63b734c84a68a3eb1583d4bdf6b', 'f');
INSERT INTO "public"."users" VALUES (785, 'Gregory Roberts', 'roberts1227@gmail.com', '651ea67401d4fe1d9b04cf552ce295b6', 't');
INSERT INTO "public"."users" VALUES (786, 'Florence Simpson', 'florencesimp6@hotmail.com', '679669687c47b92a8ff0a4989c01a7ff', 't');
INSERT INTO "public"."users" VALUES (787, 'Aaron Kennedy', 'aak@icloud.com', '6a870f455a795f910abfcc7ee2989c9c', 't');
INSERT INTO "public"."users" VALUES (788, 'Jessica James', 'jessicaj@outlook.com', '8dd4b0aeb72a2e0d36b3d1d34e8ed1ce', 'f');
INSERT INTO "public"."users" VALUES (789, 'Mario Long', 'mariolong@outlook.com', '7f69a36ba488525a84d7f73218f07dc7', 'f');
INSERT INTO "public"."users" VALUES (790, 'Arthur Hawkins', 'haa9@gmail.com', '8463018a613157e3cc1345d30a341725', 't');
INSERT INTO "public"."users" VALUES (791, 'Lucille Fernandez', 'lfe@gmail.com', '093381c2912662333f39d145e69f2abb', 't');
INSERT INTO "public"."users" VALUES (792, 'Janice Gonzalez', 'gonzaj40@yahoo.com', '7664a3c311cbd90219440daea00127b6', 't');
INSERT INTO "public"."users" VALUES (793, 'Leroy Olson', 'olsonlero1943@mail.com', '958a351b4f0695b737d0d6e33b554bc7', 'f');
INSERT INTO "public"."users" VALUES (794, 'Ray Wagner', 'wra@gmail.com', 'b2ef1c8596065c3e2b72892187eb1e72', 't');
INSERT INTO "public"."users" VALUES (795, 'Francisco Butler', 'butler80@outlook.com', '72f6d2b7132a7298c874908f6162f396', 't');
INSERT INTO "public"."users" VALUES (796, 'Christine Lewis', 'christinelew78@hotmail.com', '315d0e90d5ade597ec52011097d27382', 'f');
INSERT INTO "public"."users" VALUES (797, 'Lee Hunt', 'hulee312@outlook.com', 'af0c6ff7993d44f3a3cb1913fcac744b', 't');
INSERT INTO "public"."users" VALUES (798, 'Ethel Ward', 'ethelwa722@yahoo.com', 'db9aa0b11315a0490d112ee8f2e46fee', 'f');
INSERT INTO "public"."users" VALUES (799, 'Henry Murray', 'murray6@yahoo.com', '75b5a774a946227b54b76548356ffd6d', 'f');
INSERT INTO "public"."users" VALUES (800, 'Chad James', 'jamechad1102@gmail.com', '8761438d6dc0c0b06bac8dd7f76e57a7', 't');
INSERT INTO "public"."users" VALUES (801, 'Wayne Porter', 'porter1942@mail.com', 'df172efe8fc9bdc1e932ef0626c8dbdc', 't');
INSERT INTO "public"."users" VALUES (802, 'Lillian Hunt', 'hunt8@icloud.com', '41038e8c315581bc89002d902f06309a', 'f');
INSERT INTO "public"."users" VALUES (803, 'Melvin Ellis', 'melviellis@hotmail.com', 'b2c5741e6ab0593dcb58dc7640824ecd', 'f');
INSERT INTO "public"."users" VALUES (804, 'Glenn West', 'westglenn@icloud.com', '1336c67a388b17a30af83feaf89e5c89', 't');
INSERT INTO "public"."users" VALUES (805, 'Maria Lopez', 'mlopez605@gmail.com', '860f342f3a87cdc9d2b23d1172b46360', 't');
INSERT INTO "public"."users" VALUES (806, 'Victor Rice', 'vicrice1942@icloud.com', '7f14456416da86c12a42aefdab0f3999', 't');
INSERT INTO "public"."users" VALUES (807, 'Jeremy Patterson', 'jep3@icloud.com', 'efdfbbfb65be930db16b67c0aee0033e', 't');
INSERT INTO "public"."users" VALUES (808, 'Douglas Flores', 'douflo10@mail.com', '8683a3977d0a457bfb752952865842ce', 't');
INSERT INTO "public"."users" VALUES (809, 'Stanley Graham', 'grahamstanley@outlook.com', '5631ec95aa71484ba19f9c7cf040a024', 'f');
INSERT INTO "public"."users" VALUES (810, 'Peter Owens', 'owenspe07@mail.com', 'e8b7b7b3f85e54829a4a80a433e0e7e4', 'f');
INSERT INTO "public"."users" VALUES (811, 'Matthew Stevens', 'stevensmatth@gmail.com', 'd017dc8b7efe15da92c471b2eeabb2fa', 'f');
INSERT INTO "public"."users" VALUES (812, 'Jeff Kelly', 'keljeff@gmail.com', '4bfd6a00a419d226ad9344dcf85a085d', 'f');
INSERT INTO "public"."users" VALUES (813, 'Christine Snyder', 'christines@hotmail.com', '4c8798c1a032caa97090f7d69942c311', 't');
INSERT INTO "public"."users" VALUES (814, 'Michelle James', 'michelle1124@gmail.com', '8fd56e058b670a5ee46fd1d98697ee0a', 'f');
INSERT INTO "public"."users" VALUES (815, 'Randy Jimenez', 'randjimenez@mail.com', '700f102db5bb0752c227f5741131e206', 'f');
INSERT INTO "public"."users" VALUES (816, 'Charlotte Watson', 'charlottewatson@icloud.com', '81b4247be260e91b04f1fb65817ea2d0', 'f');
INSERT INTO "public"."users" VALUES (817, 'Howard Perry', 'howard1976@gmail.com', '8a2e3f5849bd4438cb6350fe09325ddc', 't');
INSERT INTO "public"."users" VALUES (818, 'Timothy Stone', 'stonetimothy@hotmail.com', 'ef39f5612dd83881598a3b46258b6113', 't');
INSERT INTO "public"."users" VALUES (819, 'Ellen Turner', 'turner7@gmail.com', '2ba84466d204965b39c7ec489e8a834b', 'f');
INSERT INTO "public"."users" VALUES (820, 'Wanda Harrison', 'harrisonwa327@icloud.com', '6dcc9d05f38c4a396d7875eb2a5d0d01', 't');
INSERT INTO "public"."users" VALUES (821, 'Jesus Black', 'black09@yahoo.com', '8d814f80257dc63bcb892603e9be6e76', 't');
INSERT INTO "public"."users" VALUES (822, 'Judy Johnson', 'johnsj@mail.com', 'cfbdbda257ced153bf614d7b74d0096f', 'f');
INSERT INTO "public"."users" VALUES (823, 'Donald Romero', 'romerodon@icloud.com', '50386ed4988f104819bcdd4de3cf1745', 'f');
INSERT INTO "public"."users" VALUES (824, 'Joe Lopez', 'jlop926@hotmail.com', 'df28bdc4612c4df0122cec9a5101b344', 'f');
INSERT INTO "public"."users" VALUES (825, 'Jacqueline Harris', 'hajac@gmail.com', '9cfcebd9147144a1954d990e97521ec3', 'f');
INSERT INTO "public"."users" VALUES (826, 'Amy Graham', 'graamy@gmail.com', 'd17776a7b837976fdaf67d35cd44629a', 'f');
INSERT INTO "public"."users" VALUES (827, 'Lillian Smith', 'lism@mail.com', '6ccf251db16f993916dd1157c652e453', 'f');
INSERT INTO "public"."users" VALUES (828, 'Pauline Lewis', 'lewpauline@gmail.com', '20228de5c11b116a21056690be053b18', 't');
INSERT INTO "public"."users" VALUES (829, 'Monica Hamilton', 'monhamilton3@icloud.com', '83d3f83571ec4abc4c5fd6e264d5e1f6', 't');
INSERT INTO "public"."users" VALUES (906, 'Wanda Medina', 'mwa2@outlook.com', '789099bd2c3367e468f1e6575c9ae0ad', 't');
INSERT INTO "public"."users" VALUES (830, 'Debbie Gibson', 'gibd3@icloud.com', '5d9387b829631b5cc87fb4762af9c8be', 't');
INSERT INTO "public"."users" VALUES (831, 'Norman Weaver', 'wnorman@hotmail.com', 'a741932da981164b0ab11639bdeccc35', 'f');
INSERT INTO "public"."users" VALUES (832, 'Dawn Grant', 'dawn421@outlook.com', 'd891d7485c6e58f326dba33ba5808d90', 'f');
INSERT INTO "public"."users" VALUES (833, 'Francis Ramirez', 'frramirez@icloud.com', 'bddf7ad195b70254e4cda2c2cf5005be', 'f');
INSERT INTO "public"."users" VALUES (834, 'Pauline Brooks', 'paulinebrooks@mail.com', '4a39c9c6119d456a7836e7cf558c5a99', 't');
INSERT INTO "public"."users" VALUES (835, 'Harold Webb', 'hwebb@yahoo.com', 'b9d72b146ac5ce20260ea113f98e977a', 'f');
INSERT INTO "public"."users" VALUES (836, 'Leonard Williams', 'leonardwilliams@outlook.com', '71e0e162f2cccfb94edf75a1d30ed239', 'f');
INSERT INTO "public"."users" VALUES (837, 'Rhonda Johnson', 'rhondaj310@icloud.com', 'cc72f40211daa6a260c8de80eb27865f', 't');
INSERT INTO "public"."users" VALUES (838, 'Nicholas Burns', 'nicholasburns311@gmail.com', '78bdbb7b8a1f4d68efc55fdd8d49fb4d', 't');
INSERT INTO "public"."users" VALUES (839, 'Paula Evans', 'paula1203@outlook.com', '8fca18af4d98b7f45f6639e920f47aa9', 't');
INSERT INTO "public"."users" VALUES (840, 'Helen Guzman', 'ghelen1102@outlook.com', 'f238e47c20dd588ebb4f0bde8de7c988', 'f');
INSERT INTO "public"."users" VALUES (841, 'Tracy Shaw', 'shawtracy@gmail.com', 'b6b4550138a45634972c1facca00bc9c', 't');
INSERT INTO "public"."users" VALUES (842, 'Charlotte Lopez', 'lopezcharlotte@gmail.com', '008ad499fca1c89261311196522c4581', 'f');
INSERT INTO "public"."users" VALUES (843, 'Gary Alexander', 'alexandergary02@gmail.com', '601a0637674105e3a22ad97e313bc666', 'f');
INSERT INTO "public"."users" VALUES (844, 'Kevin Lee', 'leek@gmail.com', 'dae4ebc842ccff71fdea3d06d80dfdbe', 't');
INSERT INTO "public"."users" VALUES (845, 'Brandon Fisher', 'fb8@icloud.com', 'b87fbaaba476956f1d988ba9a9e46c43', 't');
INSERT INTO "public"."users" VALUES (846, 'Randall Phillips', 'philr@icloud.com', '680f865225fdaa7f6a98075b0fee5bef', 'f');
INSERT INTO "public"."users" VALUES (847, 'Brenda Morales', 'brmorales@outlook.com', 'f8e0ece1dd6a4f5c129492ec52301442', 'f');
INSERT INTO "public"."users" VALUES (848, 'Jeff Stevens', 'stevensjeff@gmail.com', '13f83d1a5af000650f4860740a35dd9b', 'f');
INSERT INTO "public"."users" VALUES (849, 'Joan Ruiz', 'jruiz@outlook.com', '2b0ba2133f9237e6fb5535fbbf214ad0', 'f');
INSERT INTO "public"."users" VALUES (850, 'Phillip Mendoza', 'phmendoza@icloud.com', '35efcc098befe0d277c6a6f5cfbdee26', 'f');
INSERT INTO "public"."users" VALUES (851, 'Melissa Rivera', 'rivmelissa45@outlook.com', 'da64dc4cb75698f8aa3741a9e1963029', 'f');
INSERT INTO "public"."users" VALUES (852, 'Diana Aguilar', 'dianaaguilar@outlook.com', 'a173c162041ce2bc45e7c6c65ed770d3', 'f');
INSERT INTO "public"."users" VALUES (853, 'Diana Snyder', 'snyder95@yahoo.com', '449e2a38da5c20c68cf9fdf6ffb13874', 'f');
INSERT INTO "public"."users" VALUES (854, 'Louis Mills', 'mills46@yahoo.com', '0a32488b91750cedc3bd975420c5896a', 't');
INSERT INTO "public"."users" VALUES (855, 'Joanne Evans', 'joanevan@gmail.com', '345b6762c0d316b3fed24af3c2054e15', 't');
INSERT INTO "public"."users" VALUES (856, 'Rhonda Diaz', 'diazrhond@icloud.com', '68fe6bdcd2c6cc17e9d27a88e83d1811', 'f');
INSERT INTO "public"."users" VALUES (857, 'Michelle Hughes', 'hughesm5@gmail.com', 'e9a52fedd400160546502589ea537e5d', 'f');
INSERT INTO "public"."users" VALUES (858, 'Leroy Soto', 'leroysoto1013@gmail.com', '8def22dbd4adfa75c53f8c6bb8189711', 'f');
INSERT INTO "public"."users" VALUES (859, 'Janet Wilson', 'wj8@outlook.com', 'd287f64bf755327b8491387efc7f90f2', 'f');
INSERT INTO "public"."users" VALUES (860, 'Francisco Robinson', 'robinsonfran1963@gmail.com', '4aafcac893b3a4a8bd2118007e905ad5', 'f');
INSERT INTO "public"."users" VALUES (861, 'Johnny Lopez', 'lopezjohnny@icloud.com', '28367f6c36b03fba89632a8f9ed52c61', 'f');
INSERT INTO "public"."users" VALUES (862, 'Dennis Reed', 'dennreed5@gmail.com', '8ca9985f6d435b16d39897d12b08e495', 't');
INSERT INTO "public"."users" VALUES (863, 'Ray Snyder', 'snyderr@yahoo.com', '235c7677b9af561d5f12b016cbfbc1e9', 't');
INSERT INTO "public"."users" VALUES (864, 'Travis Diaz', 'travis9@mail.com', 'ed3177194cb1454dbc6b20c102848f9f', 't');
INSERT INTO "public"."users" VALUES (865, 'Anne Gray', 'grayan93@outlook.com', 'bd1d734c991260580d0ce6051075f2ff', 't');
INSERT INTO "public"."users" VALUES (866, 'William Fernandez', 'wilf@icloud.com', 'd0bbe4f0974e2b78af7a03ee8fc151b9', 'f');
INSERT INTO "public"."users" VALUES (867, 'Brenda Coleman', 'cbrenda@hotmail.com', 'd6138859bc83b8765a93825706b8869b', 'f');
INSERT INTO "public"."users" VALUES (868, 'Kathryn Mills', 'mkathryn@hotmail.com', '3d25ecb34faaac8cb1b4394e3d0eafbc', 't');
INSERT INTO "public"."users" VALUES (869, 'Theresa Griffin', 'griffin20@gmail.com', '037ebe067d1c015582b55e1d9ddb9f58', 'f');
INSERT INTO "public"."users" VALUES (870, 'Leslie Thompson', 'lesthomp605@outlook.com', 'c8a4adce79e2a029cba922b79031a233', 'f');
INSERT INTO "public"."users" VALUES (871, 'Esther Dixon', 'dixon41@gmail.com', '094fa21336bb61a33db01cf575c978a3', 'f');
INSERT INTO "public"."users" VALUES (872, 'Jane Hughes', 'hughesjane10@outlook.com', 'd760cdf24f3193528bfa4ce44221ee1e', 'f');
INSERT INTO "public"."users" VALUES (873, 'Cheryl Wells', 'cherylwell2@hotmail.com', '0fa226e382aaa167c9c41d85047b26ec', 'f');
INSERT INTO "public"."users" VALUES (874, 'Tracy Baker', 'trbak@yahoo.com', '2ee04ee0876b1891752e89673582ebe6', 't');
INSERT INTO "public"."users" VALUES (875, 'Janet Snyder', 'janet1960@gmail.com', 'a0c438f9c87c58fe1af9aecb8c7869c2', 'f');
INSERT INTO "public"."users" VALUES (876, 'Kimberly Ruiz', 'krui@mail.com', '8a9a363d325a33d578c4b25767fb9b3c', 't');
INSERT INTO "public"."users" VALUES (877, 'Walter Young', 'yowalter@gmail.com', '9dd77642c2d3fe8d8a47c49accb24e6f', 'f');
INSERT INTO "public"."users" VALUES (878, 'Bernard West', 'west702@gmail.com', '2a116ac2362e6cacc81f1174ae1da77f', 't');
INSERT INTO "public"."users" VALUES (879, 'Carol Harrison', 'charri@gmail.com', '3e0be86fb5f0f7790ac68ec718fd2423', 'f');
INSERT INTO "public"."users" VALUES (880, 'Carl Shaw', 'shawcarl2@gmail.com', '411e33d35184fff0317e5b00662e88c4', 'f');
INSERT INTO "public"."users" VALUES (881, 'Edwin Fisher', 'edwinfi@gmail.com', '564432c4e9f643f4f57873277b0a3fec', 'f');
INSERT INTO "public"."users" VALUES (882, 'Louis Powell', 'powelllouis@gmail.com', '2afb067b87dcf6101dfc4e1e731fa7f5', 'f');
INSERT INTO "public"."users" VALUES (883, 'Carlos Diaz', 'diazc823@icloud.com', '2db58aecd004fc029d78e20b58e440c2', 'f');
INSERT INTO "public"."users" VALUES (884, 'Melvin Wallace', 'wmel@yahoo.com', '3225d1df1b62ba83ff7a3dc5fc7c8d63', 't');
INSERT INTO "public"."users" VALUES (885, 'Edwin Long', 'edwinlong404@mail.com', '3f495010c64c3c8aa3812cdb4b1eb93c', 't');
INSERT INTO "public"."users" VALUES (886, 'Donna Gray', 'gdonna@mail.com', '3afbbcfc73b12b6847367b6c46ef2449', 't');
INSERT INTO "public"."users" VALUES (887, 'Rhonda Morris', 'rhondamorris@icloud.com', 'b5a75acbd113a9c65cfc6871f762ee16', 't');
INSERT INTO "public"."users" VALUES (888, 'Stephen Robinson', 'robinsteph@gmail.com', '5d62cc1cdac525a871ae20ab813ae18f', 't');
INSERT INTO "public"."users" VALUES (889, 'Benjamin Baker', 'bakerbenjamin@icloud.com', '64ca09044651567404cfca713255bb69', 't');
INSERT INTO "public"."users" VALUES (890, 'George Gutierrez', 'georgutierrez@icloud.com', 'f04f104f92003f508d7159389afe45c4', 'f');
INSERT INTO "public"."users" VALUES (891, 'Kyle Tran', 'kyletran2@gmail.com', 'c17aba54106c37411c33be8877d2d8d9', 'f');
INSERT INTO "public"."users" VALUES (892, 'Cheryl King', 'kingcheryl@outlook.com', 'b2d779292088b0881676bef5d14a11ff', 'f');
INSERT INTO "public"."users" VALUES (893, 'Jose Sullivan', 'sjose@gmail.com', '5949b1285700570b5c2a1ea9474eb01a', 'f');
INSERT INTO "public"."users" VALUES (894, 'Patrick Wilson', 'patrickwilson8@yahoo.com', '0bb08ae37b832cc84e5d141f6795348f', 'f');
INSERT INTO "public"."users" VALUES (895, 'Carl Long', 'carllong1212@icloud.com', '8b51342bf0266a98a6d39da8e4834be1', 't');
INSERT INTO "public"."users" VALUES (896, 'Victoria Powell', 'powell54@mail.com', 'c18ee97b24a6d0a2992618a94abc73ba', 'f');
INSERT INTO "public"."users" VALUES (897, 'Larry Kelley', 'kellarry4@gmail.com', 'ff088b3d34e22e0e36f0218851cb8361', 't');
INSERT INTO "public"."users" VALUES (898, 'Esther Evans', 'evest@icloud.com', '5f4dd85e998ca54cceffdf3be2b703d6', 't');
INSERT INTO "public"."users" VALUES (899, 'Steven Dixon', 'stevd@gmail.com', '5e2c5c8653f3a643e9fec4c6b6295571', 't');
INSERT INTO "public"."users" VALUES (900, 'Harry Jones', 'jonesha3@gmail.com', 'a91d3d4d519ce13f9fcc2f3486b33534', 't');
INSERT INTO "public"."users" VALUES (901, 'Tina Rogers', 'tinarog@gmail.com', '5a5f05caf11b30c40ce780f45a1236f7', 'f');
INSERT INTO "public"."users" VALUES (902, 'Johnny Kelley', 'keljohn@hotmail.com', '241f1d2d55d691653476efb66b15f576', 'f');
INSERT INTO "public"."users" VALUES (903, 'Eugene Johnson', 'ejohns@hotmail.com', '77e719c47942eef1994f7e5b931a7b52', 'f');
INSERT INTO "public"."users" VALUES (904, 'Johnny Freeman', 'freemanjoh116@icloud.com', 'cebeb6e4fba3c6427bcd9a2964f6189a', 'f');
INSERT INTO "public"."users" VALUES (905, 'Ronald Williams', 'rowilliams@gmail.com', '46ab025e502046e60b11cc6af7580e9f', 't');
INSERT INTO "public"."users" VALUES (907, 'Mario Alvarez', 'alvarez10@mail.com', '2ffcc6f17fbea39c387616f1f5d0a0f4', 'f');
INSERT INTO "public"."users" VALUES (908, 'Clarence Flores', 'floresclarence1009@gmail.com', '04562ac9ab480d927e9a4dd8a840dbe0', 't');
INSERT INTO "public"."users" VALUES (909, 'Billy Martinez', 'martbilly@outlook.com', '995c2ee8ed41255ef45c906a5083774b', 'f');
INSERT INTO "public"."users" VALUES (910, 'Gerald Howard', 'geraldhowa@gmail.com', '91d77fa56dbefb20e2ee65279e503304', 't');
INSERT INTO "public"."users" VALUES (911, 'Joel Washington', 'jowashi826@hotmail.com', '212cff1911e7b1f9de97ec09c71b119a', 'f');
INSERT INTO "public"."users" VALUES (912, 'Mildred Mills', 'millsmildred9@icloud.com', '881af4dc25dba8439d7b2d809fdd63a2', 'f');
INSERT INTO "public"."users" VALUES (913, 'Kim Mendez', 'kimm@hotmail.com', 'a1dd11f7c1f618841544f59fb6614a31', 't');
INSERT INTO "public"."users" VALUES (914, 'Carmen Gonzalez', 'gocarmen@gmail.com', '399956141e56ff19dec4aab5666b2a6a', 't');
INSERT INTO "public"."users" VALUES (915, 'Jeff Porter', 'jeffp16@gmail.com', 'c2ed1b50c35bdf125266eeb6ac55cfcc', 't');
INSERT INTO "public"."users" VALUES (916, 'Karen Carter', 'carter70@gmail.com', 'c6d62023611eeaf5927dc26f60aaefbd', 'f');
INSERT INTO "public"."users" VALUES (917, 'George Wallace', 'wallacegeorg@outlook.com', 'b65a3d9637fe1552907e6e2e3d8cf11b', 'f');
INSERT INTO "public"."users" VALUES (918, 'Don Bailey', 'baileydo9@gmail.com', 'de4b5aaff6f504657fbb4549242f21f3', 'f');
INSERT INTO "public"."users" VALUES (919, 'Marjorie Murray', 'marm89@mail.com', '24ac7708d2e29b617ff02f06d462a6ea', 'f');
INSERT INTO "public"."users" VALUES (920, 'Kelly Castillo', 'ckel@gmail.com', '7c31ed18c9ee0ff03dcbd66cb11b0b69', 't');
INSERT INTO "public"."users" VALUES (921, 'Victor Harrison', 'hvictor@gmail.com', 'deae1ece81b8d785373bda4215ce29a0', 't');
INSERT INTO "public"."users" VALUES (922, 'Jacqueline Myers', 'jacqueline606@icloud.com', 'fad346581ba9e77b0ead96bb080c8a6e', 't');
INSERT INTO "public"."users" VALUES (923, 'Lillian Hughes', 'hughes321@yahoo.com', 'ee014f94281b142ad795585dbbebdf3a', 't');
INSERT INTO "public"."users" VALUES (924, 'Phyllis Jordan', 'phyllis1959@mail.com', '809920c261c86c28d60c5427edcc4df2', 't');
INSERT INTO "public"."users" VALUES (925, 'Rose Adams', 'adamsro9@gmail.com', 'd235d995e6646b745275ed2f4d325988', 't');
INSERT INTO "public"."users" VALUES (926, 'Alfred Hill', 'hill709@outlook.com', '7f5b9c50584b00850f9a606a1677f031', 'f');
INSERT INTO "public"."users" VALUES (927, 'Diane Cox', 'coxd73@gmail.com', '6b9daed7199431c4ade804aa12f28466', 'f');
INSERT INTO "public"."users" VALUES (928, 'Elaine Dunn', 'dune@outlook.com', '8bfbcd5f6ebd8e171fb3b2d3353772a6', 'f');
INSERT INTO "public"."users" VALUES (929, 'Joshua Davis', 'jdav87@gmail.com', 'd086c9b8aa12e69d62640c8779e10ffb', 't');
INSERT INTO "public"."users" VALUES (930, 'Ray Henderson', 'rah8@yahoo.com', 'f91a0909cee38312514977ca12ad4e45', 'f');
INSERT INTO "public"."users" VALUES (931, 'Edwin Fisher', 'edwinfish@gmail.com', 'c4d13c8876fef5fe9d710f036205c4ab', 't');
INSERT INTO "public"."users" VALUES (932, 'Francis Munoz', 'munoz1976@mail.com', 'ab2435383f5a830522765ce974664fec', 'f');
INSERT INTO "public"."users" VALUES (933, 'Tiffany Lopez', 'ltiffany1120@gmail.com', '7d4b1598c836644433b1672b35d61178', 't');
INSERT INTO "public"."users" VALUES (934, 'John Harrison', 'harrisonj40@mail.com', '51cdcc06d38fd09264c97c40896ca2e1', 't');
INSERT INTO "public"."users" VALUES (935, 'Rebecca Stevens', 'stevensr10@gmail.com', '63a2e0d6909957a40796f250a5345fa5', 'f');
INSERT INTO "public"."users" VALUES (936, 'Karen Torres', 'torrekaren@outlook.com', 'e8b5a63aa19e1425e0b9e34dd88ea681', 't');
INSERT INTO "public"."users" VALUES (937, 'Edith Cox', 'coxedith6@gmail.com', '6f34a6b7522ca1273c8d624aa326046a', 't');
INSERT INTO "public"."users" VALUES (938, 'Keith Wells', 'wellskeith@outlook.com', '9264cf8c3b89be688eb43e02ab6885b7', 'f');
INSERT INTO "public"."users" VALUES (939, 'Glenn Olson', 'olsongl1006@gmail.com', 'a7958407d358f3e05f46f3037f21a3d3', 't');
INSERT INTO "public"."users" VALUES (940, 'Stephen Gutierrez', 'stephen323@gmail.com', 'b4e1c1d117a0d9f94fcaf14c29efb101', 'f');
INSERT INTO "public"."users" VALUES (941, 'Bradley Cooper', 'brac@outlook.com', 'd87feade7bae654f27b32277d506e9f8', 'f');
INSERT INTO "public"."users" VALUES (942, 'Florence Robinson', 'robinsonf7@icloud.com', '953974aaa7f165015aa239080377a195', 't');
INSERT INTO "public"."users" VALUES (943, 'Samuel Rodriguez', 'samuelrod@icloud.com', '34216b52d4ec8b659dad9999da2d513d', 't');
INSERT INTO "public"."users" VALUES (944, 'Albert Diaz', 'dal@outlook.com', '1a1966cec4cd34b5cfda7808cd1a1209', 'f');
INSERT INTO "public"."users" VALUES (945, 'Marilyn Alvarez', 'malv@mail.com', 'd48ae724894a8d8b77ad5f8b5bc5ec7c', 'f');
INSERT INTO "public"."users" VALUES (946, 'Alan Olson', 'olsonalan816@outlook.com', '3e209abd8c03123038e7e60f914c4d4b', 'f');
INSERT INTO "public"."users" VALUES (947, 'Daniel Jordan', 'danij1@icloud.com', '957e0ca1ab33077c55f73e85745c3f72', 'f');
INSERT INTO "public"."users" VALUES (948, 'Jessica Parker', 'jessicap@yahoo.com', '9f084186b8e92811e7d4561eb33691e1', 't');
INSERT INTO "public"."users" VALUES (949, 'Luis Ramirez', 'luiramirez@icloud.com', '97baba39a49d688294cf98ebad718010', 'f');
INSERT INTO "public"."users" VALUES (950, 'Arthur Marshall', 'arthmarshall@gmail.com', '77dea9cd2f6ead3bb3db4e1ebe39da89', 't');
INSERT INTO "public"."users" VALUES (951, 'Bruce Green', 'greenbruc@outlook.com', '9749f09879b8238af7eddb93da78a797', 'f');
INSERT INTO "public"."users" VALUES (952, 'Howard Soto', 'howardsot@outlook.com', '072a809916ba88e67001713f6b4dd164', 't');
INSERT INTO "public"."users" VALUES (953, 'Carl Moore', 'carmoore1@icloud.com', '59b1fb1eaef2ff993aedcda3cffda7c1', 'f');
INSERT INTO "public"."users" VALUES (954, 'Fred Wright', 'wright8@mail.com', '3d9ade64801338b2dae46e7128b42d2d', 't');
INSERT INTO "public"."users" VALUES (955, 'Jennifer Boyd', 'jennifer913@outlook.com', '541570d0b2e7bf9239a4a027990215ac', 'f');
INSERT INTO "public"."users" VALUES (956, 'Rita Owens', 'owens6@gmail.com', '1aa42c458aa42102c43fc348bc13d266', 't');
INSERT INTO "public"."users" VALUES (957, 'Jonathan Hunt', 'hjona1206@gmail.com', '7e50bafd7d90b8e678e718512837c478', 't');
INSERT INTO "public"."users" VALUES (958, 'Henry Mendez', 'mendezhenry@outlook.com', 'd75e4469eee57e29f3bdc1272619d303', 't');
INSERT INTO "public"."users" VALUES (959, 'Harold White', 'whiteh66@gmail.com', '1cfc3e242280e14ebe80f04cdcd43988', 'f');
INSERT INTO "public"."users" VALUES (960, 'Betty Stewart', 'stewartbett@mail.com', '487f51dfce7e591c873a552fd41b0da8', 't');
INSERT INTO "public"."users" VALUES (961, 'Roy Perry', 'proy625@gmail.com', '95f5c707ad8ce7e0367f764a29d04e49', 'f');
INSERT INTO "public"."users" VALUES (962, 'Paul Jones', 'jonesp1214@gmail.com', '24d10a2491ce8181db349c6904ce7c05', 'f');
INSERT INTO "public"."users" VALUES (963, 'Patrick Jenkins', 'patrijenk@outlook.com', '714e4bd7fe6abbf5f9078dc579f0807b', 'f');
INSERT INTO "public"."users" VALUES (964, 'Ricky Watson', 'rickywat@hotmail.com', '85391244446a011c448b0bf5ced1a761', 't');
INSERT INTO "public"."users" VALUES (965, 'Anna Jordan', 'jordan620@yahoo.com', 'f97241af61d4894014798a03ba6c44bd', 'f');
INSERT INTO "public"."users" VALUES (966, 'Mary Thompson', 'thommary@icloud.com', '6bf39413cae8c7ab746f1501c548f2fa', 'f');
INSERT INTO "public"."users" VALUES (967, 'Raymond Hamilton', 'hamiltonray@gmail.com', '23f5e8e57fc9a6affc7fcf10e9d4a225', 'f');
INSERT INTO "public"."users" VALUES (968, 'Ann Henderson', 'hendann1103@gmail.com', '904a6f030391b289ce3fb619a82bb158', 't');
INSERT INTO "public"."users" VALUES (969, 'Leroy Gonzales', 'legonzales@outlook.com', '315cc523703812307c62dbbc3ef2f0b9', 't');
INSERT INTO "public"."users" VALUES (970, 'Phillip Simmons', 'sphillip@gmail.com', '7f013f92a956119ce22064c75ecfff3a', 't');
INSERT INTO "public"."users" VALUES (971, 'Dale Clark', 'cdale7@gmail.com', 'd3b1d79fef57040fe6febf533a524a1a', 'f');
INSERT INTO "public"."users" VALUES (972, 'Martha Soto', 'martha2017@gmail.com', 'e654c7cf47e3efa35ae593a12c508512', 'f');
INSERT INTO "public"."users" VALUES (973, 'Lillian Gomez', 'lilliang7@hotmail.com', 'bd367e56733a2031a682db34e1e4a42a', 'f');
INSERT INTO "public"."users" VALUES (974, 'Douglas Black', 'blacdoug@outlook.com', 'c096a56beba6e0f0f8b642b1e53d20b0', 't');
INSERT INTO "public"."users" VALUES (975, 'Craig Morris', 'mcraig@yahoo.com', '912b5e1dc3836806ada70e86ef87a588', 'f');
INSERT INTO "public"."users" VALUES (976, 'Tammy Stewart', 'stammy5@outlook.com', '74fd895f90b6293afb59a11215a3e143', 'f');
INSERT INTO "public"."users" VALUES (977, 'Ethel Aguilar', 'ethelagui@gmail.com', '3d3cde065c642ef385672bd7e0d2a5f0', 'f');
INSERT INTO "public"."users" VALUES (978, 'Mildred Schmidt', 'schmmildred@gmail.com', '6fe7e8f33481c7548b41bd9344258e01', 'f');
INSERT INTO "public"."users" VALUES (979, 'Lee Ramos', 'ramoslee@outlook.com', 'fda427b1891c40adaea6bf16a803cb6c', 'f');
INSERT INTO "public"."users" VALUES (980, 'Alan Barnes', 'albarnes322@hotmail.com', 'bca14c3ef610923959fa55ed926aa86a', 't');
INSERT INTO "public"."users" VALUES (981, 'Betty Campbell', 'campbb@gmail.com', '6e001754751546f82895fe15d05e1344', 'f');
INSERT INTO "public"."users" VALUES (982, 'Janet Mendez', 'mendezjane408@gmail.com', 'd19d958a89dd6215a0918a5a4b35ec8e', 't');
INSERT INTO "public"."users" VALUES (983, 'Rose Harrison', 'rose7@outlook.com', '92693bbda41f6b1fdb0dbf43eb5b3031', 'f');
INSERT INTO "public"."users" VALUES (984, 'Harold Wright', 'wrhar@gmail.com', '4cb7a065f62400b85202d63e3fbb6ed9', 't');
INSERT INTO "public"."users" VALUES (985, 'Travis Aguilar', 'tra@gmail.com', '4f605c6c2b0ddb9e6e55b27a2b62332d', 't');
INSERT INTO "public"."users" VALUES (986, 'Amber Gardner', 'agar@gmail.com', '4f717f195732dbe968a8441270ad4935', 't');
INSERT INTO "public"."users" VALUES (987, 'Jonathan Owens', 'owenjonathan1@hotmail.com', '97b168a1d707b286605d599088618fc3', 'f');
INSERT INTO "public"."users" VALUES (988, 'Craig Reynolds', 'rc64@yahoo.com', 'e64751643ad88556a9aa198525c350cb', 'f');
INSERT INTO "public"."users" VALUES (989, 'Stephanie Clark', 'clark1025@gmail.com', '6a72c498da42f3612f95806b49e33ec8', 't');
INSERT INTO "public"."users" VALUES (990, 'Lois Henry', 'hlois214@icloud.com', '2c19d5608f3eb70d1e770a8a70b0e423', 't');
INSERT INTO "public"."users" VALUES (991, 'William Gutierrez', 'gutierrez927@yahoo.com', 'd9c4e9f878351592134b629f395dd37c', 't');
INSERT INTO "public"."users" VALUES (992, 'Valerie Johnson', 'johnvale@mail.com', 'd3820cc1471fb5d9508c9dabd91a65e2', 't');
INSERT INTO "public"."users" VALUES (993, 'Janet Cooper', 'coopjanet@gmail.com', '9322af357c8389f389a070ca45c1a40a', 'f');
INSERT INTO "public"."users" VALUES (994, 'Herbert Sanders', 'herberts51@gmail.com', '8605b385d973a1204d648b783c458e23', 't');
INSERT INTO "public"."users" VALUES (995, 'Patricia Crawford', 'patricr222@yahoo.com', 'e000927fdaaa441a6a0f4b142e738f82', 't');
INSERT INTO "public"."users" VALUES (996, 'Patrick Fox', 'patrick2@gmail.com', '97b659da643fa8b01bd69f900f206ac1', 't');
INSERT INTO "public"."users" VALUES (997, 'Emma Nichols', 'nicholse1959@gmail.com', '0243ed14b00e0d87c7f750bef6afb721', 't');
INSERT INTO "public"."users" VALUES (998, 'Jean Clark', 'clark5@icloud.com', '2930c678f3751a72399b36cdd5be1ccf', 'f');
INSERT INTO "public"."users" VALUES (999, 'Gladys Garcia', 'gladysgarcia1@gmail.com', '6349c8b1eeebf02b59a15504f7a9aaaf', 'f');
INSERT INTO "public"."users" VALUES (1000, 'Tony Long', 'longtony66@mail.com', '9fbec39804426c8bf38c1a0b7ea5498d', 'f');
INSERT INTO "public"."users" VALUES (1001, 'Troy Ellis', 'etroy@outlook.com', '7c941e9ab8be6919c9ed006d7782d1cd', 't');

-- ----------------------------
-- Creating the user_sessions table
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_sessions";
CREATE TABLE "public"."user_sessions" (
  "id" serial8 NOT NULL,
  "user_id" int8 NOT NULL,
  "token" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "expires_at" time NOT NULL,
  CONSTRAINT "user_sessions_pkey" PRIMARY KEY ("id")
);    

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_permissions_id_seq"
OWNED BY "public"."user_permissions"."id";
SELECT setval('"public"."user_permissions_id_seq"', 3, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_id_seq"
OWNED BY "public"."users"."id";
SELECT setval('"public"."users_id_seq"', 1001, true);

-- ----------------------------
-- Primary Key structure for table permissions
-- ----------------------------
ALTER TABLE "public"."permissions" ADD CONSTRAINT "permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table user_permissions
-- ----------------------------
ALTER TABLE "public"."user_permissions" ADD CONSTRAINT "user_permissions_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "users_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table user_permissions
-- ----------------------------
ALTER TABLE "public"."user_sessions" 
ADD CONSTRAINT "fk_user_sessions_user" 
FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id") ON DELETE CASCADE;