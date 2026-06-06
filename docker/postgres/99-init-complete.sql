CREATE TABLE IF NOT EXISTS public.local_init_complete (
    id integer PRIMARY KEY,
    completed_at timestamp without time zone NOT NULL DEFAULT now()
);

INSERT INTO public.local_init_complete (id)
VALUES (1)
ON CONFLICT (id) DO UPDATE SET completed_at = EXCLUDED.completed_at;
