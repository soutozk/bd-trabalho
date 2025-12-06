
-- Cria Roles de grupo 
CREATE ROLE admins NOLOGIN;
CREATE ROLE professor NOLOGIN;

-- Usuários administradores
CREATE ROLE gabriel LOGIN PASSWORD 'gabriel123';
CREATE ROLE artur   LOGIN PASSWORD 'artur123';

GRANT admins TO gabriel;
GRANT admins TO artur;

-- Usuário professor
CREATE ROLE professor_1 LOGIN PASSWORD '123456';
GRANT professor TO professor_1;

