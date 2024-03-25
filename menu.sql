INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, last_aktif, sort, icon, is_tampil) VALUES (2, NULL, 'Group', 'group', NULL, NULL, NULL, 1);
INSERT INTO public.sys_menu (id_menu, id_parent_menu, nama, url, last_aktif, sort, icon, is_tampil) VALUES (1, NULL, 'Menu', 'sys_menu', NULL, NULL, NULL, 1);


--
-- TOC entry 3657 (class 0 OID 37146)
-- Dependencies: 248
-- Data for Name: sys_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sys_action (id_action, nama, id_menu) VALUES (1, 'index', 1);
INSERT INTO public.sys_action (id_action, nama, id_menu) VALUES (3, 'delete', 1);
INSERT INTO public.sys_action (id_action, nama, id_menu) VALUES (5, 'index', 2);
INSERT INTO public.sys_action (id_action, nama, id_menu) VALUES (7, 'delete', 2);
INSERT INTO public.sys_action (id_action, nama, id_menu) VALUES (2, 'add', 1);
INSERT INTO public.sys_action (id_action, nama, id_menu) VALUES (4, 'edit', 1);
INSERT INTO public.sys_action (id_action, nama, id_menu) VALUES (6, 'add', 2);
INSERT INTO public.sys_action (id_action, nama, id_menu) VALUES (8, 'edit', 2);


--
-- TOC entry 3660 (class 0 OID 37156)
-- Dependencies: 251
-- Data for Name: sys_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sys_group (id_group, nama, last_aktif) VALUES (1, 'Administrator', NULL);
INSERT INTO public.sys_group (id_group, nama, last_aktif) VALUES (2, 'Keuangan', NULL);


--
-- TOC entry 3662 (class 0 OID 37163)
-- Dependencies: 253
-- Data for Name: sys_group_menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu) VALUES (1, 1, 1);
INSERT INTO public.sys_group_menu (id_group_menu, id_group, id_menu) VALUES (2, 1, 2);


--
-- TOC entry 3659 (class 0 OID 37153)
-- Dependencies: 250
-- Data for Name: sys_group_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sys_group_action (id_group_menu, id_action) VALUES (1, 1);
INSERT INTO public.sys_group_action (id_group_menu, id_action) VALUES (1, 2);
INSERT INTO public.sys_group_action (id_group_menu, id_action) VALUES (1, 3);
INSERT INTO public.sys_group_action (id_group_menu, id_action) VALUES (1, 4);
INSERT INTO public.sys_group_action (id_group_menu, id_action) VALUES (2, 1);
INSERT INTO public.sys_group_action (id_group_menu, id_action) VALUES (2, 2);
INSERT INTO public.sys_group_action (id_group_menu, id_action) VALUES (2, 3);
INSERT INTO public.sys_group_action (id_group_menu, id_action) VALUES (2, 4);

--
-- TOC entry 3689 (class 0 OID 37219)
-- Dependencies: 280
-- Data for Name: sys_user_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sys_user_group (id_user, id_group) VALUES (1, 1);
INSERT INTO public.sys_user_group (id_user, id_group) VALUES (1, 2);


SELECT pg_catalog.setval('public.sys_action_id_action_seq', 8, true);


--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 249
-- Name: sys_group_id_group_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_group_id_group_seq', 1, false);


--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 252
-- Name: sys_group_menu_id_group_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_group_menu_id_group_menu_seq', 2, true);

--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 256
-- Name: sys_menu_id_menu_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_menu_id_menu_seq', 2, true);


--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 258
-- Name: sys_setting_id_setting_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_setting_id_setting_seq', 1, false);


--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 260
-- Name: sys_user_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sys_user_id_user_seq', 1, true);