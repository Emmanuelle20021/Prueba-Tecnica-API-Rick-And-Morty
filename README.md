# Prueba Técnica API Rick and Morty

Este proyecto es una aplicación desarrollada con Flutter que utiliza la API de Rick and Morty para mostrar información sobre personajes. Incluye funcionalidades como una barra de búsqueda para filtrar personajes, así como un sistema de carga perezosa (lazy loading) para manejar grandes cantidades de datos.

## Instrucciones de instalación

1. **Clona el repositorio**:
   ```bash
   git clone https://github.com/Emmanuelle20021/Prueba-Tecnica-API-Rick-And-Morty.git
   cd Prueba-Tecnica-API-Rick-And-Morty
   ```

2. **Instala las dependencias**:
   Asegúrate de tener Flutter instalado en tu sistema. Luego, ejecuta:
   ```bash
   flutter pub get
   ```

3. **Ejecuta la aplicación**:
   Conecta un dispositivo o inicia un emulador y usa:
   ```bash
   flutter run
   ```

## Características principales

- **Visualización de personajes**: Obtén información sobre los personajes de Rick and Morty utilizando la API oficial.
- **Barra de búsqueda**: Busca personajes por su nombre.
- **Carga perezosa**: La aplicación carga datos conforme el usuario se desplaza, optimizando el rendimiento.
- **Recarga**: Desliza hacia abajo para recargar los personajes.

## Código generado

El proyecto incluye código generado automáticamente para manejar configuraciones específicas. Si necesitas regenerarlo, sigue estos pasos:

1. **Herramienta utilizada**:
   Asegúrate de tener instalada la herramienta necesaria para la generación (por ejemplo, `build_runner` si estás utilizando generadores en Flutter).

2. **Comando para regenerar**:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

Esto asegurará que el código generado esté actualizado y libre de conflictos.

## Tecnologías utilizadas

- **Flutter**: Framework principal para la construcción de la aplicación.
- **Dio**: Cliente HTTP para consumir la API de Rick and Morty.
- **Flutter Bloc**: Gestión del estado utilizando Cubits.

## Contribución

Si deseas contribuir al proyecto, sigue estos pasos:

1. Haz un fork del repositorio.
2. Crea una rama para tu funcionalidad (`git checkout -b feature/nueva-funcionalidad`).
3. Realiza tus cambios y haz un commit (`git commit -m 'Agrega nueva funcionalidad'`).
4. Sube tus cambios a tu fork (`git push origin feature/nueva-funcionalidad`).
5. Abre un Pull Request.

## Enlaces

- **Repositorio**: [Prueba Técnica API Rick and Morty](https://github.com/Emmanuelle20021/Prueba-Tecnica-API-Rick-And-Morty.git)
- **Documentación de la API**: [Rick and Morty API](https://rickandmortyapi.com/)

## Licencia

Este proyecto está bajo la Licencia MIT. Consulta el archivo LICENSE para más información.

