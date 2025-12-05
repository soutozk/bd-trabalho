-- ======================================================
-- D. SEGURANÇA E PERMISSÕES (DCL)
-- ======================================================

-- 1. Criar Roles de grupo (sem login)
CREATE ROLE admins NOLOGIN;
CREATE ROLE professor NOLOGIN;

----------------------------------------------------------
-- 2. Criar usuários e associar aos Roles
----------------------------------------------------------

-- Usuários administradores
CREATE ROLE gabriel LOGIN PASSWORD 'gabriel123';
CREATE ROLE artur   LOGIN PASSWORD 'artur123';

GRANT admins TO gabriel;
GRANT admins TO artur;

-- Usuário professor
CREATE ROLE professor_1 LOGIN PASSWORD '123456';
GRANT professor TO professor_1;

