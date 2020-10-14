################################### Introducción a los recursos  #############################

Los servidores se ejecutan en una colección de recursos.
un "recurso" es una coleccion de archivos, con secuencias
de comandos de cliente, secuencias de comandos de servidor
y activos de transmisión, que se pueden iniciar, detener y
reiniciar en cualquier momento.

--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------


--------------------------- Directorios de recursos ----------------------------------------

En el servidor, los recursos se cargan desde una carpeta llamada "resources/" en el directorio de datos del servidor.
Cualquier carpeta en el "resources/". Cualquier carpeta en la carpeta "resources/" se analiza como un recurso, 
excepto las carpetas entre "[brackets]" que son categorías, que pueden contener varias carpetas de recursos.

Cada carpeta de recursos también debe contener una referencia de manifiesto de recursos llamada "fxmanifest.lua (o previamente, __resource.lua) "
para ser analizado correctamente como recurso.(lo que se tiene que poner en el "fxmanifest.lua" lo explicare mas abajo, pondre aquí la linea en la que empieza cuando lo tenga (" linea 54") )

Vea este árbol de directorios de ejemplo:

---------------------------------------------------------------------------

server
└── resources
    ├── [category]
    │   ├── [another]
    │   │   └── thing
    │   │       └── fxmanifest.lua
    │   └── resource-1
    │       └── fxmanifest.lua
    └── main
        └── fxmanifest.lua

----------------------------------------------------------------------------

En este árbol, existen los siguientes recursos:

main, resource-1 y thing.

Nota: como se ve en este ejemplo se ve cargan 3 recursos, eso es poner los tres tienen el "fxmanifest.lua" o "__resource.lua" toda carpeta que este dentro de unos "[]" no la tomara como carpeta
si no como una categoría.

¿qué funcionalidad tiene las categorías?

La funcionalidad de las categorías es tener ordenado los recursos de tu servidor sin tenerlos todos en una sola carpeta, que eso provocaría que te pierdas a la hora de buscar el recurso y saber que
funcionalidad tenía ese recurso sino te acuerdas.



------------------------------------- El recurso manifest ----------------------------------------------------------------------------

Cada recurso debe contener un manifiesto de recurso con el nombre de "fxmanifest.lua" que defina qué archivos / scripts utiliza el recurso. 
A continuación, se muestra un manifiesto de ejemplo rápido:

--------------------------------------------------------------------------------------------------------------------------------------------------
-- Resource Metadata
fx_version 'cerulean' ----- esto es la version del recurso fxmanifest siempre tiene que ponerse eso porque es la version mas actualizada
games { 'rdr3', 'gta5' } ----- aquí pondreis el juego en si del que va a ser compatible vuestro recurso.

author 'Jon Doe'  ----- aquí logicamente pondreís vuestro nombre si el script os pertenece
description 'Example resource' ---- aquí no vendría mal poner una breve descripción de lo que trata el recurso
version '1.0.0' ---- esto es la version de tu recurso, esto no afecta a nada simplemente si haces cambios grandes en tu recurso simplemente actualizas la version por ejemplo si esta a 1.0.0 lo pondriamos a 1.1.0.

-- Esto es lo que va a leer de los archivos que tengas( pon todos los archivos porque si te falta alguno no te lo va a leer y si es necesario pues mal vamos)
client_scripts {
    'client.lua',
    'client_two.lua'
}
server_script 'server.lua'

--Esto ultimo no lo entiendo muy bien asi que podeis ignorarlo.(no es muy importante ya que no lo tengo visto por ningun script ni recurso)

-- Extra data can be used as well
my_data 'one' { two = 42 }
my_data 'three' { four = 69 }

-- due to Lua syntax, the following works too:
my_data('nine')({ninety = "nein"})

-----------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------Aquí os pondre otro ejemplo echo por mí --------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------

----- Recurso Metadata

fx_version 'cerulean'
games 'gta5'  ----- pongo el gta5 porque es con el que trabajo y es en el cual hago las scripts

author 'Seryii' ---- Si la script me pertenece o la modifique bastante para que funcionara bien, podría llegar a ser de mi propiedad
description 'Este recurso es una prueba ' ---- No olvideis nunca la descripción
version 'alpha' ---- no tiene porque ser numeros en la version da igual lo que pones como si pones 'mama' logicamente no tendria esa palabra sentido ahí.

client_scripts{ ----- Recordar que si son varios clients teneis que poner client_scripts si es solo uno simplemente con que pongais client_script, el server_script solo puede existir uno lo mismo para el config.lua
    '@es_extended/locale.lua',  --  <-
    'locales/es.lua',
    'config.lua',
    'client/client.lua',
    'client/client_amazon.lua'
}

server_script {
    '@mysql-async/lib/MySQL.lua',  --  <-
    '@es_extended/locale.lua',  --  <-
    'locales/es.lua',
    'config.lua',
    'server/server.lua'
}

--Si el archivo al de msql y extended tendreis que poner lo siguiente dentro del client_scripts y server_script (os marco con una flecha lo que se añade), esto solo lo añades si el archivo tiene sql
-- si no simplemente no hace falta agregarlo.

-- otro dato no os olvideis de la comas, solo en el ultimo no se le pone una coma, si en el alguno de los anteriores no pones comas te va a dar error el recurso y tendras que corregirlo.
-- si teneis una carpeta de idiomas por si quereis hacer el recurso con traducciones  por ejemplo:
--- esto en el archivo es.lua, aquí vas agregando cosas que prefieras traducirlas desde aquí, esto esta bien si vas hacerlo para varios idiomas.
Locales['es'] = {
    ['cloakroom'] = 'Guardarropa', --- esto dentro del client tendrias que poner la zona _U('cloakroom'), vale ahora preguntaras como hago que esto lo traduzca bien
}
 
--- para traducir ese _U('cloakroom') simplemente en el archivo config tendras que tener esto puesto

Config.Locale                     = 'es' --- aquí podras el idioma que quieres intentar siempre poner las dos letras

---- bien esto se tendría que hacer en caso de que quieres poner varios idiomas simplemente.

-----Vale ahora preguntareís porque pongo varios clients y server por ejemplo si tu quieres meter en una misma script varios trabajos podrías hacerlo así reduces la cantidad de scripts

---- otra cosa que teneis que tener en cuenta hay scripts que no hace falta tener dos clients y servers simplemente en el propio client y server se lo agregas por ejemplo: poner un menu
---- donde los policías puedan sacar un escudo para defenderse, eso tendreís que tener un poco de conocimiento con lo que pones.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------Aquí acaba lo que viene siendo el uso el recurso manifest, tiene un par de cosas mas pero se verán mas adelante -----------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--------------------------------------------------------------------------------- Recursos estándar -------------------------------------------------------------------------------------

Una vez que haya instalado su servidor, notará que ya tiene bastantes recursos.
Estos son los recursos estándar que FiveM envía y mantiene.
Se recomienda no cambiarlos a menos que sepa lo que está haciendo.
Muchos de estos recursos proporcionan funcionalidades útiles a su servidor.

Puede encontrar más información sobre los recursos estándar en el "catálogo de recursos" ( el catalogo de recursos lo veremos en otro momento aquí dejare en que documento estará ("") ).


-------------------------------------------------------------------------------- EJERCICIO PARA ENTREGAR --------------------------------------------------------------------------------------

entra a este link para hacer el ejercicio te recomiendo que lo hagas sin mirar, te ayudara a ver lo que sabes : https://forms.gle/XpD5qCymc9ZSNMGi6