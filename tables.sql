-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    username character varying(100) COLLATE pg_catalog."default" NOT NULL,
    password character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT users_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to postgres;


-- Table: public.expenses

-- DROP TABLE public.expenses;

CREATE TABLE public.expenses
(
    id integer NOT NULL DEFAULT nextval('expenses_id_seq'::regclass),
    expense_name character varying(100) COLLATE pg_catalog."default",
    expense_value integer,
    expense_date date,
    user_id integer,
    CONSTRAINT expenses_pkey PRIMARY KEY (id),
    CONSTRAINT expenses_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.expenses
    OWNER to postgres;

-- Table: public.categories

-- DROP TABLE public.categories;

CREATE TABLE public.categories
(
    id integer NOT NULL DEFAULT nextval('categories_id_seq'::regclass),
    category_name character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT categories_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.categories
    OWNER to postgres;


-- Table: public.expenses_categories

-- DROP TABLE public.expenses_categories;

CREATE TABLE public.expenses_categories
(
    category_id integer,
    expense_id integer,
    CONSTRAINT expenses_categories_category_id_fkey FOREIGN KEY (category_id)
        REFERENCES public.categories (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT expenses_categories_expense_id_fkey FOREIGN KEY (expense_id)
        REFERENCES public.expenses (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.expenses_categories
    OWNER to postgres;

-- Table: public.budgets

-- DROP TABLE public.budgets;

CREATE TABLE public.budgets
(
    id integer NOT NULL DEFAULT nextval('budgets_id_seq'::regclass),
    monthly_budget integer,
    user_id integer,
    CONSTRAINT budgets_pkey PRIMARY KEY (id),
    CONSTRAINT budgets_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.budgets
    OWNER to postgres;