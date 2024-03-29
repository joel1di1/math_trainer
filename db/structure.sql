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

SET default_tablespace = '';

--
-- Name: answers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.answers (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    problem_id bigint NOT NULL,
    text character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    correct boolean,
    card_session_id bigint
);


--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.answers_id_seq OWNED BY public.answers.id;


--
-- Name: answers_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.answers_sessions (
    id bigint NOT NULL,
    answer_id bigint NOT NULL,
    time_session_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: answers_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.answers_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: answers_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.answers_sessions_id_seq OWNED BY public.answers_sessions.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: card_session_problems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.card_session_problems (
    id bigint NOT NULL,
    problem_id bigint NOT NULL,
    card_session_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: card_session_problems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.card_session_problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: card_session_problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.card_session_problems_id_seq OWNED BY public.card_session_problems.id;


--
-- Name: card_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.card_sessions (
    id bigint NOT NULL,
    title character varying,
    user_id bigint,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: card_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.card_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: card_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.card_sessions_id_seq OWNED BY public.card_sessions.id;


--
-- Name: problems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.problems (
    id bigint NOT NULL,
    type character varying,
    number_1 integer,
    number_2 integer,
    hole_position integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: problems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.problems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.problems_id_seq OWNED BY public.problems.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: time_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.time_sessions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    minutes integer,
    operation_types character varying,
    frequencies character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: time_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.time_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: time_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.time_sessions_id_seq OWNED BY public.time_sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    "DeviseCreateUsers" character varying,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: answers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers ALTER COLUMN id SET DEFAULT nextval('public.answers_id_seq'::regclass);


--
-- Name: answers_sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers_sessions ALTER COLUMN id SET DEFAULT nextval('public.answers_sessions_id_seq'::regclass);


--
-- Name: card_session_problems id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.card_session_problems ALTER COLUMN id SET DEFAULT nextval('public.card_session_problems_id_seq'::regclass);


--
-- Name: card_sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.card_sessions ALTER COLUMN id SET DEFAULT nextval('public.card_sessions_id_seq'::regclass);


--
-- Name: problems id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problems ALTER COLUMN id SET DEFAULT nextval('public.problems_id_seq'::regclass);


--
-- Name: time_sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_sessions ALTER COLUMN id SET DEFAULT nextval('public.time_sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: answers_sessions answers_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers_sessions
    ADD CONSTRAINT answers_sessions_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: card_session_problems card_session_problems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.card_session_problems
    ADD CONSTRAINT card_session_problems_pkey PRIMARY KEY (id);


--
-- Name: card_sessions card_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.card_sessions
    ADD CONSTRAINT card_sessions_pkey PRIMARY KEY (id);


--
-- Name: problems problems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.problems
    ADD CONSTRAINT problems_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: time_sessions time_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_sessions
    ADD CONSTRAINT time_sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_answers_on_card_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_card_session_id ON public.answers USING btree (card_session_id);


--
-- Name: index_answers_on_problem_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_problem_id ON public.answers USING btree (problem_id);


--
-- Name: index_answers_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_on_user_id ON public.answers USING btree (user_id);


--
-- Name: index_answers_sessions_on_answer_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_sessions_on_answer_id ON public.answers_sessions USING btree (answer_id);


--
-- Name: index_answers_sessions_on_time_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_answers_sessions_on_time_session_id ON public.answers_sessions USING btree (time_session_id);


--
-- Name: index_card_session_problems_on_card_session_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_card_session_problems_on_card_session_id ON public.card_session_problems USING btree (card_session_id);


--
-- Name: index_card_session_problems_on_problem_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_card_session_problems_on_problem_id ON public.card_session_problems USING btree (problem_id);


--
-- Name: index_card_sessions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_card_sessions_on_user_id ON public.card_sessions USING btree (user_id);


--
-- Name: index_time_sessions_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_time_sessions_on_user_id ON public.time_sessions USING btree (user_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: answers_sessions fk_rails_1b633a06ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers_sessions
    ADD CONSTRAINT fk_rails_1b633a06ac FOREIGN KEY (answer_id) REFERENCES public.answers(id);


--
-- Name: answers fk_rails_341789c96b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_341789c96b FOREIGN KEY (card_session_id) REFERENCES public.card_sessions(id);


--
-- Name: card_sessions fk_rails_3b3364163f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.card_sessions
    ADD CONSTRAINT fk_rails_3b3364163f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: card_session_problems fk_rails_3e252f1e91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.card_session_problems
    ADD CONSTRAINT fk_rails_3e252f1e91 FOREIGN KEY (card_session_id) REFERENCES public.card_sessions(id);


--
-- Name: answers_sessions fk_rails_4140d59875; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers_sessions
    ADD CONSTRAINT fk_rails_4140d59875 FOREIGN KEY (time_session_id) REFERENCES public.time_sessions(id);


--
-- Name: answers fk_rails_584be190c2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_584be190c2 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: card_session_problems fk_rails_a6095bd5ec; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.card_session_problems
    ADD CONSTRAINT fk_rails_a6095bd5ec FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- Name: time_sessions fk_rails_a7e0badd86; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.time_sessions
    ADD CONSTRAINT fk_rails_a7e0badd86 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: answers fk_rails_b6b51e72e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.answers
    ADD CONSTRAINT fk_rails_b6b51e72e3 FOREIGN KEY (problem_id) REFERENCES public.problems(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO "schema_migrations" (version) VALUES
('20200515220612'),
('20200515224516'),
('20200515233437'),
('20200517003426'),
('20200814130905'),
('20200814130935'),
('20200920152051'),
('20200920165430'),
('20211230112526'),
('20220123194342');


