--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 9.6.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hibernate_sequences; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.hibernate_sequences (
    sequence_name character varying(40) NOT NULL,
    next_val bigint NOT NULL
);


ALTER TABLE public.hibernate_sequences OWNER TO ldoc;

--
-- Name: ld_attributeset; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_attributeset (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_name character varying(255) NOT NULL,
    ld_description character varying(2000),
    ld_readonly integer NOT NULL,
    ld_type integer NOT NULL
);


ALTER TABLE public.ld_attributeset OWNER TO ldoc;

--
-- Name: ld_attributeset_ext; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_attributeset_ext (
    ld_attsetid bigint NOT NULL,
    ld_mandatory integer NOT NULL,
    ld_type integer NOT NULL,
    ld_editor integer NOT NULL,
    ld_position integer NOT NULL,
    ld_stringvalue character varying(4000),
    ld_stringvalues character varying(4000),
    ld_intvalue bigint,
    ld_doublevalue double precision,
    ld_datevalue timestamp without time zone,
    ld_name character varying(255) NOT NULL,
    ld_label character varying(255),
    ld_setid bigint NOT NULL,
    ld_hidden integer NOT NULL,
    ld_multiple integer NOT NULL,
    ld_parent character varying(255)
);


ALTER TABLE public.ld_attributeset_ext OWNER TO ldoc;

--
-- Name: ld_bookmark; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_bookmark (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_userid bigint NOT NULL,
    ld_docid bigint NOT NULL,
    ld_title character varying(255) NOT NULL,
    ld_description character varying(4000),
    ld_position integer NOT NULL,
    ld_filetype character varying(40),
    ld_type integer NOT NULL
);


ALTER TABLE public.ld_bookmark OWNER TO ldoc;

--
-- Name: ld_contact; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_contact (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_userid bigint,
    ld_firstname character varying(255),
    ld_lastname character varying(255),
    ld_email character varying(512),
    ld_company character varying(255),
    ld_address character varying(512),
    ld_phone character varying(255),
    ld_mobile character varying(255)
);


ALTER TABLE public.ld_contact OWNER TO ldoc;

--
-- Name: ld_dashlet; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_dashlet (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_name character varying(255),
    ld_title character varying(255),
    ld_type character varying(255),
    ld_query character varying(4000),
    ld_content character varying(4000),
    ld_max integer
);


ALTER TABLE public.ld_dashlet OWNER TO ldoc;

--
-- Name: ld_document; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_document (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_immutable integer NOT NULL,
    ld_customid character varying(200),
    ld_version character varying(255),
    ld_fileversion character varying(10),
    ld_date timestamp without time zone,
    ld_creation timestamp without time zone NOT NULL,
    ld_publisher character varying(255),
    ld_publisherid bigint NOT NULL,
    ld_creator character varying(255),
    ld_creatorid bigint NOT NULL,
    ld_status integer,
    ld_type character varying(255),
    ld_lockuserid bigint,
    ld_lockuser character varying(255),
    ld_language character varying(10),
    ld_filename character varying(255),
    ld_password character varying(255),
    ld_filesize bigint,
    ld_indexed integer NOT NULL,
    ld_barcoded integer NOT NULL,
    ld_signed integer NOT NULL,
    ld_stamped integer NOT NULL,
    ld_digest character varying(255),
    ld_folderid bigint,
    ld_templateid bigint,
    ld_exportstatus integer NOT NULL,
    ld_exportid bigint,
    ld_exportname character varying(255),
    ld_exportversion character varying(10),
    ld_docref bigint,
    ld_docreftype character varying(255),
    ld_deleteuserid bigint,
    ld_deleteuser character varying(255),
    ld_rating integer,
    ld_comment character varying(1000),
    ld_workflowstatus character varying(1000),
    ld_workflowstatusdisp character varying(1000),
    ld_published integer NOT NULL,
    ld_startpublishing timestamp without time zone,
    ld_stoppublishing timestamp without time zone,
    ld_transactionid character varying(255),
    ld_extresid character varying(255),
    ld_tgs character varying(1000),
    ld_pages integer NOT NULL,
    ld_nature integer NOT NULL,
    ld_formid bigint
);


ALTER TABLE public.ld_document OWNER TO ldoc;

--
-- Name: ld_document_ext; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_document_ext (
    ld_docid bigint NOT NULL,
    ld_mandatory integer NOT NULL,
    ld_type integer NOT NULL,
    ld_editor integer NOT NULL,
    ld_position integer NOT NULL,
    ld_stringvalue character varying(4000),
    ld_stringvalues character varying(4000),
    ld_intvalue bigint,
    ld_doublevalue double precision,
    ld_datevalue timestamp without time zone,
    ld_name character varying(255) NOT NULL,
    ld_label character varying(255),
    ld_setid bigint,
    ld_hidden integer NOT NULL,
    ld_multiple integer NOT NULL,
    ld_parent character varying(255)
);


ALTER TABLE public.ld_document_ext OWNER TO ldoc;

--
-- Name: ld_extoption; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_extoption (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_setid bigint NOT NULL,
    ld_attribute character varying(255) NOT NULL,
    ld_value character varying(255) NOT NULL,
    ld_label character varying(1000),
    ld_position integer NOT NULL
);


ALTER TABLE public.ld_extoption OWNER TO ldoc;

--
-- Name: ld_folder; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_folder (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_name character varying(255),
    ld_parentid bigint NOT NULL,
    ld_securityref bigint,
    ld_description character varying(4000),
    ld_type integer NOT NULL,
    ld_creation timestamp without time zone,
    ld_creator character varying(255),
    ld_creatorid bigint,
    ld_templateid bigint,
    ld_templocked integer NOT NULL,
    ld_deleteuserid bigint,
    ld_deleteuser character varying(255),
    ld_position integer NOT NULL,
    ld_quotadocs bigint,
    ld_quotasize bigint,
    ld_hidden integer NOT NULL,
    ld_foldref bigint,
    ld_level integer,
    ld_storage integer,
    ld_maxversions integer,
    ld_color character varying(255),
    ld_tgs character varying(1000),
    ld_qthreshold integer,
    ld_qrecipients character varying(1000)
);


ALTER TABLE public.ld_folder OWNER TO ldoc;

--
-- Name: ld_folder_ext; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_folder_ext (
    ld_folderid bigint NOT NULL,
    ld_mandatory integer NOT NULL,
    ld_type integer NOT NULL,
    ld_editor integer NOT NULL,
    ld_position integer NOT NULL,
    ld_stringvalue character varying(4000),
    ld_stringvalues character varying(4000),
    ld_intvalue bigint,
    ld_doublevalue double precision,
    ld_datevalue timestamp without time zone,
    ld_name character varying(255) NOT NULL,
    ld_label character varying(255),
    ld_setid bigint,
    ld_hidden integer NOT NULL,
    ld_multiple integer NOT NULL,
    ld_parent character varying(255)
);


ALTER TABLE public.ld_folder_ext OWNER TO ldoc;

--
-- Name: ld_folder_history; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_folder_history (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_docid bigint,
    ld_folderid bigint,
    ld_userid bigint,
    ld_date timestamp without time zone,
    ld_username character varying(255),
    ld_event character varying(255),
    ld_comment character varying(4000),
    ld_reason character varying(4000),
    ld_version character varying(255),
    ld_path character varying(4000),
    ld_pathold character varying(4000),
    ld_notified integer NOT NULL,
    ld_sessionid character varying(255),
    ld_new integer,
    ld_filename character varying(255),
    ld_filenameold character varying(255),
    ld_userlogin character varying(255),
    ld_ip character varying(255)
);


ALTER TABLE public.ld_folder_history OWNER TO ldoc;

--
-- Name: ld_foldergroup; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_foldergroup (
    ld_folderid bigint NOT NULL,
    ld_groupid bigint NOT NULL,
    ld_write integer NOT NULL,
    ld_add integer NOT NULL,
    ld_security integer NOT NULL,
    ld_immutable integer NOT NULL,
    ld_delete integer NOT NULL,
    ld_rename integer NOT NULL,
    ld_import integer NOT NULL,
    ld_export integer NOT NULL,
    ld_sign integer NOT NULL,
    ld_archive integer NOT NULL,
    ld_workflow integer NOT NULL,
    ld_download integer NOT NULL,
    ld_calendar integer NOT NULL,
    ld_subscription integer NOT NULL,
    ld_print integer NOT NULL,
    ld_password integer NOT NULL,
    ld_move integer NOT NULL,
    ld_email integer NOT NULL,
    ld_automation integer NOT NULL
);


ALTER TABLE public.ld_foldergroup OWNER TO ldoc;

--
-- Name: ld_foldertag; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_foldertag (
    ld_folderid bigint,
    ld_tenantid bigint NOT NULL,
    ld_tag character varying(255)
);


ALTER TABLE public.ld_foldertag OWNER TO ldoc;

--
-- Name: ld_generic; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_generic (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_type character varying(255) NOT NULL,
    ld_subtype character varying(255) NOT NULL,
    ld_qualifier bigint,
    ld_string1 character varying(4000),
    ld_string2 character varying(4000),
    ld_string3 character varying(4000),
    ld_string4 character varying(4000),
    ld_integer1 bigint,
    ld_integer2 bigint,
    ld_integer3 bigint,
    ld_double1 double precision,
    ld_double2 double precision,
    ld_date1 timestamp without time zone,
    ld_date2 timestamp without time zone
);


ALTER TABLE public.ld_generic OWNER TO ldoc;

--
-- Name: ld_generic_ext; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_generic_ext (
    ld_genid bigint NOT NULL,
    ld_mandatory integer NOT NULL,
    ld_type integer NOT NULL,
    ld_editor bigint NOT NULL,
    ld_position integer NOT NULL,
    ld_stringvalue character varying(4000),
    ld_stringvalues character varying(4000),
    ld_intvalue bigint,
    ld_doublevalue double precision,
    ld_datevalue timestamp without time zone,
    ld_name character varying(255) NOT NULL,
    ld_label character varying(255),
    ld_setid bigint,
    ld_hidden integer NOT NULL,
    ld_multiple integer NOT NULL,
    ld_parent character varying(255)
);


ALTER TABLE public.ld_generic_ext OWNER TO ldoc;

--
-- Name: ld_group; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_group (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_name character varying(255) NOT NULL,
    ld_description character varying(255),
    ld_type integer NOT NULL,
    ld_source character varying(255)
);


ALTER TABLE public.ld_group OWNER TO ldoc;

--
-- Name: ld_history; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_history (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_docid bigint,
    ld_folderid bigint,
    ld_userid bigint,
    ld_date timestamp without time zone,
    ld_username character varying(255),
    ld_event character varying(255),
    ld_comment character varying(4000),
    ld_reason character varying(4000),
    ld_version character varying(255),
    ld_path character varying(4000),
    ld_pathold character varying(4000),
    ld_notified integer NOT NULL,
    ld_sessionid character varying(255),
    ld_new integer,
    ld_filename character varying(255),
    ld_filenameold character varying(255),
    ld_userlogin character varying(255),
    ld_ip character varying(255)
);


ALTER TABLE public.ld_history OWNER TO ldoc;

--
-- Name: ld_link; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_link (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_type character varying(255) NOT NULL,
    ld_docid1 bigint,
    ld_docid2 bigint
);


ALTER TABLE public.ld_link OWNER TO ldoc;

--
-- Name: ld_menu; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_menu (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_name character varying(255),
    ld_parentid bigint NOT NULL,
    ld_securityref bigint,
    ld_icon character varying(255),
    ld_type integer NOT NULL,
    ld_description character varying(4000),
    ld_position integer NOT NULL
);


ALTER TABLE public.ld_menu OWNER TO ldoc;

--
-- Name: ld_menugroup; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_menugroup (
    ld_menuid bigint NOT NULL,
    ld_groupid bigint NOT NULL,
    ld_write integer NOT NULL
);


ALTER TABLE public.ld_menugroup OWNER TO ldoc;

--
-- Name: ld_messagetemplate; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_messagetemplate (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_name character varying(255) NOT NULL,
    ld_language character varying(10) NOT NULL,
    ld_description character varying(1000),
    ld_body character varying(4000),
    ld_type character varying(255),
    ld_subject character varying(1000)
);


ALTER TABLE public.ld_messagetemplate OWNER TO ldoc;

--
-- Name: ld_note; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_note (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_docid bigint NOT NULL,
    ld_username character varying(255),
    ld_userid bigint,
    ld_date timestamp without time zone,
    ld_filename character varying(255),
    ld_message character varying(4000),
    ld_snippet character varying(4000),
    ld_page integer NOT NULL
);


ALTER TABLE public.ld_note OWNER TO ldoc;

--
-- Name: ld_patch; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_patch (
    ld_patch character varying(255),
    ld_date timestamp without time zone,
    ld_version character varying(255)
);


ALTER TABLE public.ld_patch OWNER TO ldoc;

--
-- Name: ld_rating; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_rating (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_docid bigint NOT NULL,
    ld_userid bigint NOT NULL,
    ld_vote integer NOT NULL,
    ld_username character varying(255)
);


ALTER TABLE public.ld_rating OWNER TO ldoc;

--
-- Name: ld_recipient; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_recipient (
    ld_messageid bigint NOT NULL,
    ld_name character varying(255) NOT NULL,
    ld_address character varying(255) NOT NULL,
    ld_mode character varying(255) NOT NULL,
    ld_type integer NOT NULL,
    ld_read integer NOT NULL
);


ALTER TABLE public.ld_recipient OWNER TO ldoc;

--
-- Name: ld_sequence; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_sequence (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_name character varying(255) NOT NULL,
    ld_objectid bigint NOT NULL,
    ld_lastreset timestamp without time zone,
    ld_value bigint NOT NULL
);


ALTER TABLE public.ld_sequence OWNER TO ldoc;

--
-- Name: ld_session; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_session (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_sid character varying(255) NOT NULL,
    ld_username character varying(255),
    ld_key character varying(255),
    ld_node character varying(255),
    ld_tenantname character varying(255),
    ld_creation timestamp without time zone,
    ld_lastrenew timestamp without time zone,
    ld_status integer NOT NULL,
    ld_clientid character varying(255),
    ld_clientaddr character varying(255),
    ld_clienthost character varying(255)
);


ALTER TABLE public.ld_session OWNER TO ldoc;

--
-- Name: ld_systemmessage; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_systemmessage (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_author character varying(255),
    ld_messagetext character varying(4000),
    ld_subject character varying(255),
    ld_sentdate timestamp without time zone NOT NULL,
    ld_datescope integer,
    ld_prio integer,
    ld_confirmation integer,
    ld_lastnotified timestamp without time zone,
    ld_status integer NOT NULL,
    ld_trials integer,
    ld_type integer NOT NULL,
    ld_html integer NOT NULL
);


ALTER TABLE public.ld_systemmessage OWNER TO ldoc;

--
-- Name: ld_tag; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_tag (
    ld_docid bigint,
    ld_tenantid bigint NOT NULL,
    ld_tag character varying(255)
);


ALTER TABLE public.ld_tag OWNER TO ldoc;

--
-- Name: ld_temp; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_temp (
    ld_int bigint,
    ld_date timestamp without time zone,
    ld_string character varying(4000)
);


ALTER TABLE public.ld_temp OWNER TO ldoc;

--
-- Name: ld_template; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_template (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_name character varying(255) NOT NULL,
    ld_description character varying(2000),
    ld_readonly integer NOT NULL,
    ld_type integer NOT NULL
);


ALTER TABLE public.ld_template OWNER TO ldoc;

--
-- Name: ld_template_ext; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_template_ext (
    ld_templateid bigint NOT NULL,
    ld_mandatory integer NOT NULL,
    ld_type integer NOT NULL,
    ld_editor integer NOT NULL,
    ld_position integer NOT NULL,
    ld_stringvalue character varying(4000),
    ld_stringvalues character varying(4000),
    ld_intvalue bigint,
    ld_doublevalue double precision,
    ld_datevalue timestamp without time zone,
    ld_name character varying(255) NOT NULL,
    ld_label character varying(255),
    ld_setid bigint,
    ld_hidden integer NOT NULL,
    ld_multiple integer NOT NULL,
    ld_parent character varying(255)
);


ALTER TABLE public.ld_template_ext OWNER TO ldoc;

--
-- Name: ld_tenant; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_tenant (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_name character varying(255),
    ld_displayname character varying(4000),
    ld_enabled integer NOT NULL,
    ld_expire timestamp without time zone,
    ld_street character varying(255),
    ld_postalcode character varying(255),
    ld_city character varying(255),
    ld_country character varying(255),
    ld_state character varying(255),
    ld_email character varying(255),
    ld_telephone character varying(255),
    ld_maxusers integer,
    ld_maxsessions integer,
    ld_maxrepodocs bigint,
    ld_maxreposize bigint,
    ld_type integer NOT NULL,
    ld_qthreshold integer,
    ld_qrecipients character varying(1000),
    ld_maxguests integer
);


ALTER TABLE public.ld_tenant OWNER TO ldoc;

--
-- Name: ld_ticket; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_ticket (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_ticketid character varying(255) NOT NULL,
    ld_docid bigint NOT NULL,
    ld_userid bigint NOT NULL,
    ld_type integer NOT NULL,
    ld_creation timestamp without time zone NOT NULL,
    ld_expired timestamp without time zone,
    ld_count integer NOT NULL,
    ld_suffix character varying(255)
);


ALTER TABLE public.ld_ticket OWNER TO ldoc;

--
-- Name: ld_uniquetag; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_uniquetag (
    ld_tag character varying(255) NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_count bigint
);


ALTER TABLE public.ld_uniquetag OWNER TO ldoc;

--
-- Name: ld_update; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_update (
    ld_update character varying(255),
    ld_date timestamp without time zone,
    ld_version character varying(255)
);


ALTER TABLE public.ld_update OWNER TO ldoc;

--
-- Name: ld_user; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_user (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_enabled integer NOT NULL,
    ld_username character varying(255) NOT NULL,
    ld_password character varying(255),
    ld_passwordmd4 character varying(255),
    ld_name character varying(255),
    ld_firstname character varying(255),
    ld_street character varying(255),
    ld_postalcode character varying(255),
    ld_city character varying(255),
    ld_country character varying(255),
    ld_state character varying(255),
    ld_language character varying(10),
    ld_email character varying(255),
    ld_emailsignature character varying(1000),
    ld_telephone character varying(255),
    ld_telephone2 character varying(255),
    ld_type integer NOT NULL,
    ld_passwordchanged timestamp without time zone,
    ld_passwordexpires integer NOT NULL,
    ld_source integer NOT NULL,
    ld_quota bigint NOT NULL,
    ld_welcomescreen integer,
    ld_ipwhitelist character varying(1000),
    ld_ipblacklist character varying(1000),
    ld_passwordexpired integer NOT NULL,
    ld_defworkspace bigint,
    ld_email2 character varying(255),
    ld_emailsignature2 character varying(1000),
    ld_certexpire timestamp without time zone,
    ld_certdn character varying(1000),
    ld_certpass character varying(255),
    ld_secondfactor character varying(255),
    ld_key character varying(255),
    ld_creation timestamp without time zone
);


ALTER TABLE public.ld_user OWNER TO ldoc;

--
-- Name: ld_user_history; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_user_history (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_userid bigint,
    ld_date timestamp without time zone,
    ld_username character varying(255),
    ld_event character varying(255),
    ld_comment character varying(4000),
    ld_reason character varying(4000),
    ld_notified integer NOT NULL,
    ld_sessionid character varying(255),
    ld_new integer,
    ld_filename character varying(255),
    ld_userlogin character varying(255),
    ld_ip character varying(255),
    ld_author character varying(255)
);


ALTER TABLE public.ld_user_history OWNER TO ldoc;

--
-- Name: ld_usergroup; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_usergroup (
    ld_groupid bigint NOT NULL,
    ld_userid bigint NOT NULL
);


ALTER TABLE public.ld_usergroup OWNER TO ldoc;

--
-- Name: ld_version; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_version (
    ld_id bigint NOT NULL,
    ld_lastmodified timestamp without time zone NOT NULL,
    ld_recordversion bigint NOT NULL,
    ld_deleted integer NOT NULL,
    ld_tenantid bigint NOT NULL,
    ld_immutable integer NOT NULL,
    ld_customid character varying(200),
    ld_version character varying(255),
    ld_fileversion character varying(10),
    ld_date timestamp without time zone,
    ld_creation timestamp without time zone,
    ld_publisher character varying(255),
    ld_publisherid bigint NOT NULL,
    ld_creator character varying(255),
    ld_creatorid bigint NOT NULL,
    ld_status integer,
    ld_type character varying(255),
    ld_lockuserid bigint,
    ld_lockuser character varying(255),
    ld_language character varying(10),
    ld_filename character varying(255),
    ld_password character varying(255),
    ld_filesize bigint,
    ld_indexed integer NOT NULL,
    ld_barcoded integer NOT NULL,
    ld_signed integer NOT NULL,
    ld_stamped integer NOT NULL,
    ld_digest character varying(255),
    ld_folderid bigint,
    ld_foldername character varying(1000),
    ld_templateid bigint,
    ld_templatename character varying(1000),
    ld_tgs character varying(1000),
    ld_username character varying(255),
    ld_userid bigint,
    ld_versiondate timestamp without time zone,
    ld_comment character varying(1000),
    ld_event character varying(255),
    ld_documentid bigint NOT NULL,
    ld_exportstatus integer NOT NULL,
    ld_exportid bigint,
    ld_exportname character varying(255),
    ld_exportversion character varying(10),
    ld_deleteuserid bigint,
    ld_workflowstatus character varying(1000),
    ld_workflowstatusdisp character varying(1000),
    ld_published integer NOT NULL,
    ld_startpublishing timestamp without time zone,
    ld_stoppublishing timestamp without time zone,
    ld_transactionid character varying(255),
    ld_extresid character varying(255),
    ld_pages integer NOT NULL,
    ld_nature integer NOT NULL,
    ld_formid bigint
);


ALTER TABLE public.ld_version OWNER TO ldoc;

--
-- Name: ld_version_ext; Type: TABLE; Schema: public; Owner: ldoc
--

CREATE TABLE public.ld_version_ext (
    ld_versionid bigint NOT NULL,
    ld_mandatory integer NOT NULL,
    ld_type integer NOT NULL,
    ld_editor integer NOT NULL,
    ld_position integer NOT NULL,
    ld_stringvalue character varying(4000),
    ld_stringvalues character varying(4000),
    ld_intvalue bigint,
    ld_doublevalue double precision,
    ld_datevalue timestamp without time zone,
    ld_name character varying(255) NOT NULL,
    ld_label character varying(255),
    ld_setid bigint,
    ld_hidden integer NOT NULL,
    ld_multiple integer NOT NULL,
    ld_parent character varying(255)
);


ALTER TABLE public.ld_version_ext OWNER TO ldoc;

--
-- Data for Name: hibernate_sequences; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.hibernate_sequences (sequence_name, next_val) FROM stdin;
ld_document	100
ld_bookmark	100
ld_generic	100
ld_group	100
ld_history	100
ld_link	100
ld_menu	5000
ld_systemmessage	100
ld_template	100
ld_ticket	100
ld_user	100
ld_version	100
ld_folder	100
ld_folder_history	100
ld_rating	100
ld_note	100
ld_messagetemplate	100
ld_tenant	100
ld_sequence	100
ld_extoption	100
ld_attributeset	100
ld_dashlet	100
ld_user_history	101
ld_session	101
\.


--
-- Data for Name: ld_attributeset; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_attributeset (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_name, ld_description, ld_readonly, ld_type) FROM stdin;
\.


--
-- Data for Name: ld_attributeset_ext; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_attributeset_ext (ld_attsetid, ld_mandatory, ld_type, ld_editor, ld_position, ld_stringvalue, ld_stringvalues, ld_intvalue, ld_doublevalue, ld_datevalue, ld_name, ld_label, ld_setid, ld_hidden, ld_multiple, ld_parent) FROM stdin;
\.


--
-- Data for Name: ld_bookmark; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_bookmark (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_userid, ld_docid, ld_title, ld_description, ld_position, ld_filetype, ld_type) FROM stdin;
\.


--
-- Data for Name: ld_contact; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_contact (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_userid, ld_firstname, ld_lastname, ld_email, ld_company, ld_address, ld_phone, ld_mobile) FROM stdin;
\.


--
-- Data for Name: ld_dashlet; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_dashlet (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_name, ld_title, ld_type, ld_query, ld_content, ld_max) FROM stdin;
1	2019-09-20 15:01:30.568259	1	0	1	checkout	event.checkedoutdocs	document	from Document where lockUserId=$user.id and status=1 order by date desc	\N	10
2	2019-09-20 15:01:30.576177	1	0	1	checkin	event.checkedindocs	docevent	from DocumentHistory where userId=$user.id and event='event.checkedin' order by date desc	\N	10
3	2019-09-20 15:01:30.584486	1	0	1	locked	event.lockeddocs	document	from Document where lockUserId=$user.id and status=2 order by date desc	\N	10
4	2019-09-20 15:01:30.592946	1	0	1	download	event.downloadeddocs	docevent	from DocumentHistory where userId=$user.id and event='event.downloaded' order by date desc	\N	10
5	2019-09-20 15:01:30.601201	1	0	1	change	event.changeddocs	docevent	from DocumentHistory where userId=$user.id and event='event.changed' order by date desc	\N	10
6	2019-09-20 15:01:30.677947	1	0	1	notes	lastnotes	note	from DocumentNote where userId=$user.id order by date desc	\N	10
7	2019-09-20 15:01:30.691106	1	0	1	tagcloud	tagcloud	content	\N	\N	10
\.


--
-- Data for Name: ld_document; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_document (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_immutable, ld_customid, ld_version, ld_fileversion, ld_date, ld_creation, ld_publisher, ld_publisherid, ld_creator, ld_creatorid, ld_status, ld_type, ld_lockuserid, ld_lockuser, ld_language, ld_filename, ld_password, ld_filesize, ld_indexed, ld_barcoded, ld_signed, ld_stamped, ld_digest, ld_folderid, ld_templateid, ld_exportstatus, ld_exportid, ld_exportname, ld_exportversion, ld_docref, ld_docreftype, ld_deleteuserid, ld_deleteuser, ld_rating, ld_comment, ld_workflowstatus, ld_workflowstatusdisp, ld_published, ld_startpublishing, ld_stoppublishing, ld_transactionid, ld_extresid, ld_tgs, ld_pages, ld_nature, ld_formid) FROM stdin;
\.


--
-- Data for Name: ld_document_ext; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_document_ext (ld_docid, ld_mandatory, ld_type, ld_editor, ld_position, ld_stringvalue, ld_stringvalues, ld_intvalue, ld_doublevalue, ld_datevalue, ld_name, ld_label, ld_setid, ld_hidden, ld_multiple, ld_parent) FROM stdin;
\.


--
-- Data for Name: ld_extoption; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_extoption (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_setid, ld_attribute, ld_value, ld_label, ld_position) FROM stdin;
\.


--
-- Data for Name: ld_folder; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_folder (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_name, ld_parentid, ld_securityref, ld_description, ld_type, ld_creation, ld_creator, ld_creatorid, ld_templateid, ld_templocked, ld_deleteuserid, ld_deleteuser, ld_position, ld_quotadocs, ld_quotasize, ld_hidden, ld_foldref, ld_level, ld_storage, ld_maxversions, ld_color, ld_tgs, ld_qthreshold, ld_qrecipients) FROM stdin;
5	2019-09-20 15:01:30.452565	1	0	1	/	5	\N	\N	1	2019-09-20 15:01:30.452565	\N	\N	\N	0	\N	\N	1	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N
4	2019-09-20 15:01:30.493913	1	0	1	Default	5	\N	\N	1	2019-09-20 15:01:30.493913	\N	\N	\N	0	\N	\N	1	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: ld_folder_ext; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_folder_ext (ld_folderid, ld_mandatory, ld_type, ld_editor, ld_position, ld_stringvalue, ld_stringvalues, ld_intvalue, ld_doublevalue, ld_datevalue, ld_name, ld_label, ld_setid, ld_hidden, ld_multiple, ld_parent) FROM stdin;
\.


--
-- Data for Name: ld_folder_history; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_folder_history (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_docid, ld_folderid, ld_userid, ld_date, ld_username, ld_event, ld_comment, ld_reason, ld_version, ld_path, ld_pathold, ld_notified, ld_sessionid, ld_new, ld_filename, ld_filenameold, ld_userlogin, ld_ip) FROM stdin;
\.


--
-- Data for Name: ld_foldergroup; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_foldergroup (ld_folderid, ld_groupid, ld_write, ld_add, ld_security, ld_immutable, ld_delete, ld_rename, ld_import, ld_export, ld_sign, ld_archive, ld_workflow, ld_download, ld_calendar, ld_subscription, ld_print, ld_password, ld_move, ld_email, ld_automation) FROM stdin;
5	2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0
5	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0
5	4	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0
5	-10000	0	0	0	0	0	0	0	0	0	0	0	0	0	0	1	0	0	0	0
4	2	1	1	0	0	1	1	0	0	0	0	0	1	1	0	1	0	1	1	0
4	3	0	0	0	0	0	0	0	0	0	0	0	1	1	0	1	0	1	1	0
4	4	1	1	0	0	1	1	0	0	0	0	0	1	1	0	1	0	1	1	0
4	-10000	1	1	0	0	1	1	0	0	0	0	0	1	1	0	1	0	1	1	0
\.


--
-- Data for Name: ld_foldertag; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_foldertag (ld_folderid, ld_tenantid, ld_tag) FROM stdin;
\.


--
-- Data for Name: ld_generic; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_generic (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_type, ld_subtype, ld_qualifier, ld_string1, ld_string2, ld_string3, ld_string4, ld_integer1, ld_integer2, ld_integer3, ld_double1, ld_double2, ld_date1, ld_date2) FROM stdin;
-50	2019-09-20 15:01:29.883699	1	0	1	usersetting	dashlet-1	1	0	\N	\N	\N	1	0	0	\N	\N	\N	\N
-51	2019-09-20 15:01:29.892102	1	0	1	usersetting	dashlet-3	1	0	\N	\N	\N	3	0	1	\N	\N	\N	\N
-52	2019-09-20 15:01:29.900071	1	0	1	usersetting	dashlet-6	1	0	\N	\N	\N	6	1	0	\N	\N	\N	\N
\.


--
-- Data for Name: ld_generic_ext; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_generic_ext (ld_genid, ld_mandatory, ld_type, ld_editor, ld_position, ld_stringvalue, ld_stringvalues, ld_intvalue, ld_doublevalue, ld_datevalue, ld_name, ld_label, ld_setid, ld_hidden, ld_multiple, ld_parent) FROM stdin;
\.


--
-- Data for Name: ld_group; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_group (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_name, ld_description, ld_type, ld_source) FROM stdin;
1	2019-09-20 15:01:29.809537	1	0	1	admin	Group of admins	0	local
2	2019-09-20 15:01:29.817761	1	0	1	author	Group of authors	0	local
3	2019-09-20 15:01:29.825889	1	0	1	guest	Group of guests	0	local
4	2019-09-20 15:01:29.834211	1	0	1	poweruser	Group of power users	0	local
-10000	2019-09-20 15:01:29.842545	1	0	1	publisher	Group of publishers	0	local
-1	2019-09-20 15:01:29.858857	1	0	1	_user_1	\N	1	local
-1010	2019-09-20 15:01:29.916789	1	0	1	_user_-1010		1	local
\.


--
-- Data for Name: ld_history; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_history (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_docid, ld_folderid, ld_userid, ld_date, ld_username, ld_event, ld_comment, ld_reason, ld_version, ld_path, ld_pathold, ld_notified, ld_sessionid, ld_new, ld_filename, ld_filenameold, ld_userlogin, ld_ip) FROM stdin;
\.


--
-- Data for Name: ld_link; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_link (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_type, ld_docid1, ld_docid2) FROM stdin;
\.


--
-- Data for Name: ld_menu; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_menu (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_name, ld_parentid, ld_securityref, ld_icon, ld_type, ld_description, ld_position) FROM stdin;
1	2019-09-20 15:01:29.505504	1	0	1	/	1	\N	menu.png	1	\N	1
2	2019-09-20 15:01:29.513528	1	0	1	administration	1	\N	menu.png	1	\N	20
9	2019-09-20 15:01:29.521621	1	0	1	security	2	\N	menu.png	1	\N	20
8	2019-09-20 15:01:29.529659	1	0	1	impex	2	\N	menu.png	1	\N	40
25	2019-09-20 15:01:29.537933	1	0	1	documentmetadata	2	\N	menu.png	1	\N	30
7	2019-09-20 15:01:29.545677	1	0	1	settings	2	\N	menu.png	1	\N	60
5	2019-09-20 15:01:29.55346	1	0	1	frontend	1	\N	menu.png	1	\N	1
1500	2019-09-20 15:01:29.561535	1	0	1	documents	5	\N	menu.png	1	\N	50
1600	2019-09-20 15:01:29.570107	1	0	1	history	1500	\N	menu.png	1	\N	10
1601	2019-09-20 15:01:29.578455	1	0	1	sessions	1600	\N	menu.png	1	\N	10
1602	2019-09-20 15:01:29.586291	1	0	1	trash	1500	\N	menu.png	1	\N	10
1603	2019-09-20 15:01:29.594542	1	0	1	versions	1500	\N	menu.png	1	\N	10
1605	2019-09-20 15:01:29.602966	1	0	1	aliases	1500	\N	menu.png	1	\N	10
1510	2019-09-20 15:01:29.610914	1	0	1	search	5	\N	menu.png	1	\N	60
1520	2019-09-20 15:01:29.619154	1	0	1	dashboard	5	\N	menu.png	1	\N	40
1525	2019-09-20 15:01:29.627526	1	0	1	messages	1520	\N	menu.png	1	\N	40
80	2019-09-20 15:01:29.635628	1	0	1	system	2	\N	system.png	1	\N	10
90	2019-09-20 15:01:29.643875	1	0	1	reports	2	\N	reports.png	1	\N	50
100	2019-09-20 15:01:29.652183	1	0	1	parameters	7	\N	settings.png	1	\N	60
105	2019-09-20 15:01:29.660989	1	0	1	repositories	7	\N	repositories.png	1	\N	60
14	2019-09-20 15:01:29.669426	1	0	1	scheduledtasks	80	\N	menu.png	1	\N	1
-2	2019-09-20 15:01:29.677101	1	0	1	lastchanges	90	\N	menu.png	1	\N	1
-3	2019-09-20 15:01:29.685665	1	0	1	lockeddocs	90	\N	menu.png	1	\N	1
-5	2019-09-20 15:01:29.693896	1	0	1	deleteddocs	90	\N	menu.png	1	\N	1
-6	2019-09-20 15:01:29.709495	1	0	1	deletedfolders	90	\N	menu.png	1	\N	1
3	2019-09-20 15:01:29.718914	1	0	1	clienandextapps	7	\N	menu.png	1	\N	1
110	2019-09-20 15:01:29.727099	1	0	1	mainmenu	5	\N	menu.png	1	\N	10
16	2019-09-20 15:01:29.73563	1	0	1	tools	110	\N	menu.png	1	\N	20
40	2019-09-20 15:01:29.7434	1	0	1	personal	110	\N	menu.png	1	\N	10
1530	2019-09-20 15:01:29.751679	1	0	1	contacts	40	\N	menu.png	1	\N	1
1535	2019-09-20 15:01:29.76044	1	0	1	interfacedensity	110	\N	menu.png	1	\N	5
70	2019-09-20 15:01:29.768186	1	0	1	general	80	\N	menu.png	1	\N	20
71	2019-09-20 15:01:29.776139	1	0	1	sessions	70	\N	menu.png	1	\N	20
72	2019-09-20 15:01:29.784497	1	0	1	logs	70	\N	menu.png	1	\N	20
73	2019-09-20 15:01:29.792586	1	0	1	runlevel	70	\N	menu.png	1	\N	20
200	2019-09-20 15:01:29.801359	1	0	1	textcontent	16	\N	text.png	1	\N	1
-2070	2019-09-20 15:01:30.904878	1	0	1	dropbox	16	\N	document.png	1	\N	1
\.


--
-- Data for Name: ld_menugroup; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_menugroup (ld_menuid, ld_groupid, ld_write) FROM stdin;
2	4	0
14	4	0
25	4	0
5	2	0
5	3	0
5	4	0
5	-10000	0
1500	2	0
1500	3	0
1500	4	0
1500	-10000	0
1510	2	0
1510	3	0
1510	4	0
1510	-10000	0
1520	2	0
1520	3	0
1520	4	0
1520	-10000	0
1525	2	0
1525	3	0
1525	4	0
1525	-10000	0
1530	2	0
1530	3	0
1530	4	0
1530	-10000	0
1535	2	0
1535	3	0
1535	4	0
1535	-10000	0
200	2	0
200	3	0
200	4	0
1602	2	0
1602	3	0
1602	4	0
1602	-10000	0
1603	2	0
1603	3	0
1603	4	0
1603	-10000	0
-2070	2	0
-2070	3	0
-2070	4	0
-2070	-10000	0
\.


--
-- Data for Name: ld_messagetemplate; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_messagetemplate (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_name, ld_language, ld_description, ld_body, ld_type, ld_subject) FROM stdin;
1	2019-09-20 15:01:30.535512	1	0	1	task.report	en	\N	$task<br/>\r\n$I18N.get('startedon'): <b>$DateTool.format($started, true)</b><br/>\r\n$I18N.get('finishedon'): <b>$DateTool.format($ended, true)</b><br/>\r\n<hr/>\r\n#if( $error )\r\n$I18N.get('error'): <b>$error</b>\r\n<hr />\r\n#end\r\n$report	system	$product - $task
2	2019-09-20 15:01:30.543781	1	0	1	psw.rec1	en	\N	$I18N.format('emailnotifyaccount', $user.fullName) <br/>\r\n$I18N.get('username'): <b>$user.username</b> <br/>\r\n$I18N.get('password'): <b>$password</b> <br/>\r\n$I18N.get('clickhere'): <a href="$url">$url</a>	system	$product - $I18N.get('emailnotifyaccountobject')
3	2019-09-20 15:01:30.551887	1	0	1	psw.rec2	en	\N	$product - $I18N.get('passwordrequest') <br/>\r\n$I18N.get('clickhere'): <a href="$url">$url</a>	system	$product - $I18N.get('passwordrequest')
4	2019-09-20 15:01:30.559717	1	0	1	newdoc	en	\N	$I18N.get('newdocscreated')<br/>\r\n<hr/>\r\n$message\r\n<hr/>\r\n$I18N.get('user'): <b>$creator.fullName</b><br/>\r\n$I18N.get('date'): <b>$DateTool.format($CURRENT_DATE, true)</b><br/>\r\n<hr/>\r\n<b>$I18N.get('documents')</b>:\r\n#foreach( $doc in $documents )\r\n  <br/>$doc.fileName | <a href="$DocTool.downloadUrl($doc)">$I18N.get('download')</a> | <a href="$DocTool.displayUrl($doc)">$I18N.get('display')</a>\r\n#end	system	$product - $I18N.get('newdocscreated')
\.


--
-- Data for Name: ld_note; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_note (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_docid, ld_username, ld_userid, ld_date, ld_filename, ld_message, ld_snippet, ld_page) FROM stdin;
\.


--
-- Data for Name: ld_patch; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_patch (ld_patch, ld_date, ld_version) FROM stdin;
\.


--
-- Data for Name: ld_rating; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_rating (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_docid, ld_userid, ld_vote, ld_username) FROM stdin;
\.


--
-- Data for Name: ld_recipient; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_recipient (ld_messageid, ld_name, ld_address, ld_mode, ld_type, ld_read) FROM stdin;
\.


--
-- Data for Name: ld_sequence; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_sequence (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_name, ld_objectid, ld_lastreset, ld_value) FROM stdin;
\.


--
-- Data for Name: ld_session; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_session (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_sid, ld_username, ld_key, ld_node, ld_tenantname, ld_creation, ld_lastrenew, ld_status, ld_clientid, ld_clientaddr, ld_clienthost) FROM stdin;
100	2019-09-20 15:02:11.067	0	0	1	0dcc503b-9444-4aa9-842d-f816c59e9c2a	admin	\N	0fc968ac-0a08-4755-ba3c-7261baf65d14	default	2019-09-20 15:02:10.996	2019-09-20 15:02:10.996	0	admin-92668751-172.17.0.1	172.17.0.1	172.17.0.1
\.


--
-- Data for Name: ld_systemmessage; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_systemmessage (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_author, ld_messagetext, ld_subject, ld_sentdate, ld_datescope, ld_prio, ld_confirmation, ld_lastnotified, ld_status, ld_trials, ld_type, ld_html) FROM stdin;
\.


--
-- Data for Name: ld_tag; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_tag (ld_docid, ld_tenantid, ld_tag) FROM stdin;
\.


--
-- Data for Name: ld_temp; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_temp (ld_int, ld_date, ld_string) FROM stdin;
\.


--
-- Data for Name: ld_template; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_template (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_name, ld_description, ld_readonly, ld_type) FROM stdin;
\.


--
-- Data for Name: ld_template_ext; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_template_ext (ld_templateid, ld_mandatory, ld_type, ld_editor, ld_position, ld_stringvalue, ld_stringvalues, ld_intvalue, ld_doublevalue, ld_datevalue, ld_name, ld_label, ld_setid, ld_hidden, ld_multiple, ld_parent) FROM stdin;
\.


--
-- Data for Name: ld_tenant; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_tenant (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_name, ld_displayname, ld_enabled, ld_expire, ld_street, ld_postalcode, ld_city, ld_country, ld_state, ld_email, ld_telephone, ld_maxusers, ld_maxsessions, ld_maxrepodocs, ld_maxreposize, ld_type, ld_qthreshold, ld_qrecipients, ld_maxguests) FROM stdin;
1	2019-09-20 15:01:29.497295	1	0	1	default	Default	1	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	\N	\N	\N
\.


--
-- Data for Name: ld_ticket; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_ticket (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_ticketid, ld_docid, ld_userid, ld_type, ld_creation, ld_expired, ld_count, ld_suffix) FROM stdin;
\.


--
-- Data for Name: ld_uniquetag; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_uniquetag (ld_tag, ld_tenantid, ld_count) FROM stdin;
\.


--
-- Data for Name: ld_update; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_update (ld_update, ld_date, ld_version) FROM stdin;
\.


--
-- Data for Name: ld_user; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_user (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_enabled, ld_username, ld_password, ld_passwordmd4, ld_name, ld_firstname, ld_street, ld_postalcode, ld_city, ld_country, ld_state, ld_language, ld_email, ld_emailsignature, ld_telephone, ld_telephone2, ld_type, ld_passwordchanged, ld_passwordexpires, ld_source, ld_quota, ld_welcomescreen, ld_ipwhitelist, ld_ipblacklist, ld_passwordexpired, ld_defworkspace, ld_email2, ld_emailsignature2, ld_certexpire, ld_certdn, ld_certpass, ld_secondfactor, ld_key, ld_creation) FROM stdin;
1	2019-09-20 15:01:29.851476	1	0	1	1	admin	d033e22ae348aeb566fc214aec3585c4da997	U8FeEPvxYRhKNCBsLa0K+1rD1tTtR6yctJIwxje2QMwEOlEQx9HuiA==	Admin	Admin					\N	fr	admin@admin.net	\N			0	\N	0	0	-1	1520	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
-1010	2019-09-20 15:01:29.908884	1	0	1	1	_system		\N	User	System					\N	fr	system@acme.com	\N		\N	1	\N	0	0	-1	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: ld_user_history; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_user_history (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_userid, ld_date, ld_username, ld_event, ld_comment, ld_reason, ld_notified, ld_sessionid, ld_new, ld_filename, ld_userlogin, ld_ip, ld_author) FROM stdin;
100	2019-09-20 15:02:11.026	0	0	1	1	2019-09-20 15:02:10.999	Admin Admin	event.user.login	172.17.0.1	\N	0	0dcc503b-9444-4aa9-842d-f816c59e9c2a	1	\N	admin	172.17.0.1	\N
\.


--
-- Data for Name: ld_usergroup; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_usergroup (ld_groupid, ld_userid) FROM stdin;
1	1
-1	1
-1010	-1010
\.


--
-- Data for Name: ld_version; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_version (ld_id, ld_lastmodified, ld_recordversion, ld_deleted, ld_tenantid, ld_immutable, ld_customid, ld_version, ld_fileversion, ld_date, ld_creation, ld_publisher, ld_publisherid, ld_creator, ld_creatorid, ld_status, ld_type, ld_lockuserid, ld_lockuser, ld_language, ld_filename, ld_password, ld_filesize, ld_indexed, ld_barcoded, ld_signed, ld_stamped, ld_digest, ld_folderid, ld_foldername, ld_templateid, ld_templatename, ld_tgs, ld_username, ld_userid, ld_versiondate, ld_comment, ld_event, ld_documentid, ld_exportstatus, ld_exportid, ld_exportname, ld_exportversion, ld_deleteuserid, ld_workflowstatus, ld_workflowstatusdisp, ld_published, ld_startpublishing, ld_stoppublishing, ld_transactionid, ld_extresid, ld_pages, ld_nature, ld_formid) FROM stdin;
\.


--
-- Data for Name: ld_version_ext; Type: TABLE DATA; Schema: public; Owner: ldoc
--

COPY public.ld_version_ext (ld_versionid, ld_mandatory, ld_type, ld_editor, ld_position, ld_stringvalue, ld_stringvalues, ld_intvalue, ld_doublevalue, ld_datevalue, ld_name, ld_label, ld_setid, ld_hidden, ld_multiple, ld_parent) FROM stdin;
\.


--
-- Name: hibernate_sequences hibernate_sequences_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.hibernate_sequences
    ADD CONSTRAINT hibernate_sequences_pkey PRIMARY KEY (sequence_name);


--
-- Name: ld_attributeset_ext ld_attributeset_ext_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_attributeset_ext
    ADD CONSTRAINT ld_attributeset_ext_pkey PRIMARY KEY (ld_setid, ld_name);


--
-- Name: ld_attributeset ld_attributeset_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_attributeset
    ADD CONSTRAINT ld_attributeset_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_bookmark ld_bookmark_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_bookmark
    ADD CONSTRAINT ld_bookmark_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_contact ld_contact_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_contact
    ADD CONSTRAINT ld_contact_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_dashlet ld_dashlet_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_dashlet
    ADD CONSTRAINT ld_dashlet_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_document_ext ld_document_ext_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_document_ext
    ADD CONSTRAINT ld_document_ext_pkey PRIMARY KEY (ld_docid, ld_name);


--
-- Name: ld_document ld_document_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_document
    ADD CONSTRAINT ld_document_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_extoption ld_extoption_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_extoption
    ADD CONSTRAINT ld_extoption_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_folder_ext ld_folder_ext_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_folder_ext
    ADD CONSTRAINT ld_folder_ext_pkey PRIMARY KEY (ld_folderid, ld_name);


--
-- Name: ld_folder_history ld_folder_history_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_folder_history
    ADD CONSTRAINT ld_folder_history_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_folder ld_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_folder
    ADD CONSTRAINT ld_folder_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_generic_ext ld_generic_ext_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_generic_ext
    ADD CONSTRAINT ld_generic_ext_pkey PRIMARY KEY (ld_genid, ld_name);


--
-- Name: ld_generic ld_generic_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_generic
    ADD CONSTRAINT ld_generic_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_group ld_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_group
    ADD CONSTRAINT ld_group_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_history ld_history_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_history
    ADD CONSTRAINT ld_history_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_link ld_link_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_link
    ADD CONSTRAINT ld_link_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_menu ld_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_menu
    ADD CONSTRAINT ld_menu_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_messagetemplate ld_messagetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_messagetemplate
    ADD CONSTRAINT ld_messagetemplate_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_note ld_note_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_note
    ADD CONSTRAINT ld_note_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_rating ld_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_rating
    ADD CONSTRAINT ld_rating_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_sequence ld_sequence_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_sequence
    ADD CONSTRAINT ld_sequence_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_session ld_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_session
    ADD CONSTRAINT ld_session_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_systemmessage ld_systemmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_systemmessage
    ADD CONSTRAINT ld_systemmessage_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_template_ext ld_template_ext_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_template_ext
    ADD CONSTRAINT ld_template_ext_pkey PRIMARY KEY (ld_templateid, ld_name);


--
-- Name: ld_template ld_template_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_template
    ADD CONSTRAINT ld_template_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_tenant ld_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_tenant
    ADD CONSTRAINT ld_tenant_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_ticket ld_ticket_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_ticket
    ADD CONSTRAINT ld_ticket_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_uniquetag ld_uniquetag_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_uniquetag
    ADD CONSTRAINT ld_uniquetag_pkey PRIMARY KEY (ld_tag, ld_tenantid);


--
-- Name: ld_user_history ld_user_history_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_user_history
    ADD CONSTRAINT ld_user_history_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_user ld_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_user
    ADD CONSTRAINT ld_user_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_usergroup ld_usergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_usergroup
    ADD CONSTRAINT ld_usergroup_pkey PRIMARY KEY (ld_groupid, ld_userid);


--
-- Name: ld_version_ext ld_version_ext_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_version_ext
    ADD CONSTRAINT ld_version_ext_pkey PRIMARY KEY (ld_versionid, ld_name);


--
-- Name: ld_version ld_version_pkey; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_version
    ADD CONSTRAINT ld_version_pkey PRIMARY KEY (ld_id);


--
-- Name: ld_foldergroup pk_ld_foldergroup; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_foldergroup
    ADD CONSTRAINT pk_ld_foldergroup PRIMARY KEY (ld_folderid, ld_groupid);


--
-- Name: ld_menugroup pk_ld_menugroup; Type: CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_menugroup
    ADD CONSTRAINT pk_ld_menugroup PRIMARY KEY (ld_menuid, ld_groupid);


--
-- Name: ak_attributeset; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_attributeset ON public.ld_attributeset USING btree (ld_name, ld_tenantid);


--
-- Name: ak_dashlet; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_dashlet ON public.ld_dashlet USING btree (ld_name, ld_tenantid);


--
-- Name: ak_document; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_document ON public.ld_document USING btree (ld_customid, ld_tenantid);


--
-- Name: ak_extoption; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_extoption ON public.ld_extoption USING btree (ld_setid, ld_attribute, ld_value);


--
-- Name: ak_generic; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_generic ON public.ld_generic USING btree (ld_type, ld_subtype, ld_qualifier, ld_tenantid);


--
-- Name: ak_group; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_group ON public.ld_group USING btree (ld_name, ld_tenantid);


--
-- Name: ak_link; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_link ON public.ld_link USING btree (ld_docid1, ld_docid2, ld_type);


--
-- Name: ak_msgtempl; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_msgtempl ON public.ld_messagetemplate USING btree (ld_name, ld_language, ld_tenantid);


--
-- Name: ak_rating; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_rating ON public.ld_rating USING btree (ld_docid, ld_userid);


--
-- Name: ak_sequence; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_sequence ON public.ld_sequence USING btree (ld_name, ld_objectid, ld_tenantid);


--
-- Name: ak_session; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_session ON public.ld_session USING btree (ld_sid);


--
-- Name: ak_template; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_template ON public.ld_template USING btree (ld_name, ld_tenantid);


--
-- Name: ak_tenant; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_tenant ON public.ld_tenant USING btree (ld_name);


--
-- Name: ak_ticket; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_ticket ON public.ld_ticket USING btree (ld_ticketid);


--
-- Name: ak_user; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_user ON public.ld_user USING btree (ld_username);


--
-- Name: ak_version; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE UNIQUE INDEX ak_version ON public.ld_version USING btree (ld_documentid, ld_version);


--
-- Name: ld_doc_fid; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_doc_fid ON public.ld_document USING btree (ld_folderid);


--
-- Name: ld_doc_luid; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_doc_luid ON public.ld_document USING btree (ld_lockuserid);


--
-- Name: ld_doc_rid; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_doc_rid ON public.ld_document USING btree (ld_docref);


--
-- Name: ld_doc_status; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_doc_status ON public.ld_document USING btree (ld_status);


--
-- Name: ld_ext_name; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_ext_name ON public.ld_document_ext USING btree (ld_name);


--
-- Name: ld_fhist_fid; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_fhist_fid ON public.ld_folder_history USING btree (ld_folderid);


--
-- Name: ld_fhist_not; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_fhist_not ON public.ld_folder_history USING btree (ld_notified);


--
-- Name: ld_fld_name; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_fld_name ON public.ld_folder USING btree (ld_name);


--
-- Name: ld_ftag_tag; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_ftag_tag ON public.ld_foldertag USING btree (ld_tag);


--
-- Name: ld_hist_docid; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_hist_docid ON public.ld_history USING btree (ld_docid);


--
-- Name: ld_hist_event; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_hist_event ON public.ld_history USING btree (ld_event);


--
-- Name: ld_hist_not; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_hist_not ON public.ld_history USING btree (ld_notified);


--
-- Name: ld_hist_uid; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_hist_uid ON public.ld_history USING btree (ld_userid);


--
-- Name: ld_rcp_mid_name; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_rcp_mid_name ON public.ld_recipient USING btree (ld_messageid, ld_name);


--
-- Name: ld_tag_tag; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_tag_tag ON public.ld_tag USING btree (ld_tag);


--
-- Name: ld_uhist_uid; Type: INDEX; Schema: public; Owner: ldoc
--

CREATE INDEX ld_uhist_uid ON public.ld_user_history USING btree (ld_userid);


--
-- Name: ld_link fk1330661cadd6216; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_link
    ADD CONSTRAINT fk1330661cadd6216 FOREIGN KEY (ld_docid1) REFERENCES public.ld_document(ld_id);


--
-- Name: ld_link fk1330661cadd6217; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_link
    ADD CONSTRAINT fk1330661cadd6217 FOREIGN KEY (ld_docid2) REFERENCES public.ld_document(ld_id);


--
-- Name: ld_usergroup fk2435438d76f11ea1; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_usergroup
    ADD CONSTRAINT fk2435438d76f11ea1 FOREIGN KEY (ld_groupid) REFERENCES public.ld_group(ld_id);


--
-- Name: ld_usergroup fk2435438db8b12ca9; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_usergroup
    ADD CONSTRAINT fk2435438db8b12ca9 FOREIGN KEY (ld_userid) REFERENCES public.ld_user(ld_id);


--
-- Name: ld_recipient fk406a04126621debe; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_recipient
    ADD CONSTRAINT fk406a04126621debe FOREIGN KEY (ld_messageid) REFERENCES public.ld_systemmessage(ld_id);


--
-- Name: ld_document_ext fk4e0884647c693dfd; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_document_ext
    ADD CONSTRAINT fk4e0884647c693dfd FOREIGN KEY (ld_docid) REFERENCES public.ld_document(ld_id);


--
-- Name: ld_tag fk55bbda227c693dfd; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_tag
    ADD CONSTRAINT fk55bbda227c693dfd FOREIGN KEY (ld_docid) REFERENCES public.ld_document(ld_id);


--
-- Name: ld_template_ext fk6babb84376c86307; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_template_ext
    ADD CONSTRAINT fk6babb84376c86307 FOREIGN KEY (ld_templateid) REFERENCES public.ld_template(ld_id);


--
-- Name: ld_document fk75ed9c0276c86307; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_document
    ADD CONSTRAINT fk75ed9c0276c86307 FOREIGN KEY (ld_templateid) REFERENCES public.ld_template(ld_id);


--
-- Name: ld_document fk75ed9c027c565c60; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_document
    ADD CONSTRAINT fk75ed9c027c565c60 FOREIGN KEY (ld_folderid) REFERENCES public.ld_folder(ld_id);


--
-- Name: ld_version_ext fk78c3a1f3b90495ee; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_version_ext
    ADD CONSTRAINT fk78c3a1f3b90495ee FOREIGN KEY (ld_versionid) REFERENCES public.ld_version(ld_id);


--
-- Name: ld_generic_ext fk913af772cf8376c7; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_generic_ext
    ADD CONSTRAINT fk913af772cf8376c7 FOREIGN KEY (ld_genid) REFERENCES public.ld_generic(ld_id);


--
-- Name: ld_version fk9b3bd9118a053ce; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_version
    ADD CONSTRAINT fk9b3bd9118a053ce FOREIGN KEY (ld_documentid) REFERENCES public.ld_document(ld_id);


--
-- Name: ld_attributeset_ext fk_att_attset; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_attributeset_ext
    ADD CONSTRAINT fk_att_attset FOREIGN KEY (ld_attsetid) REFERENCES public.ld_attributeset(ld_id);


--
-- Name: ld_foldergroup fk_fgroup_folder; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_foldergroup
    ADD CONSTRAINT fk_fgroup_folder FOREIGN KEY (ld_folderid) REFERENCES public.ld_folder(ld_id) ON DELETE CASCADE;


--
-- Name: ld_folder fk_folder_parent; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_folder
    ADD CONSTRAINT fk_folder_parent FOREIGN KEY (ld_parentid) REFERENCES public.ld_folder(ld_id);


--
-- Name: ld_folder fk_folder_template; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_folder
    ADD CONSTRAINT fk_folder_template FOREIGN KEY (ld_templateid) REFERENCES public.ld_template(ld_id);


--
-- Name: ld_folder_ext fk_folderext_folder; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_folder_ext
    ADD CONSTRAINT fk_folderext_folder FOREIGN KEY (ld_folderid) REFERENCES public.ld_folder(ld_id);


--
-- Name: ld_menu fk_menu_parent; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_menu
    ADD CONSTRAINT fk_menu_parent FOREIGN KEY (ld_parentid) REFERENCES public.ld_menu(ld_id);


--
-- Name: ld_menugroup fk_menugroup_group; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_menugroup
    ADD CONSTRAINT fk_menugroup_group FOREIGN KEY (ld_groupid) REFERENCES public.ld_group(ld_id) ON DELETE CASCADE;


--
-- Name: ld_menugroup fk_mgroup_menu; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_menugroup
    ADD CONSTRAINT fk_mgroup_menu FOREIGN KEY (ld_menuid) REFERENCES public.ld_menu(ld_id) ON DELETE CASCADE;


--
-- Name: ld_foldertag fk_tag_folder; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_foldertag
    ADD CONSTRAINT fk_tag_folder FOREIGN KEY (ld_folderid) REFERENCES public.ld_folder(ld_id);


--
-- Name: ld_ticket fk_ticket_user; Type: FK CONSTRAINT; Schema: public; Owner: ldoc
--

ALTER TABLE ONLY public.ld_ticket
    ADD CONSTRAINT fk_ticket_user FOREIGN KEY (ld_userid) REFERENCES public.ld_user(ld_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

