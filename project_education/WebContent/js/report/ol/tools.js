/**
 *
 * 지도기능 > 도구
 *
 */


var wgs84Sphere = new ol.Sphere(6378137);

/**
 * Get Layer By layerID
 * @param map
 * @param id
 * @returns
 */
function getLayerById(map, id) {
	return getLayersByProperty(map, 'layerId', id)[0];
}

/**
 * Get Layer By LayerProperty
 * @param map
 * @param property
 * @param value
 * @returns {Array}
 */
function getLayersByProperty(map, property, value) {
	var layers = [];
	map.getLayers().forEach(function(l) {
		if (l.getProperties()[property] == value) {
			layers.push(l);
		}
	});
	return layers;
}

/**
 * Change BaseLayer
 * @param map
 * @param layerId
 */
function changeBaseLayer(map, layerId) {
	map.getLayers().forEach(function(l, opt_this) {
		var properties = l.getProperties();
		if (properties.isBaseLayer) {
			if (properties.layerId == layerId) {
				l.setVisible(true);
			} else {
				l.setVisible(false);
			}
		}
	});
}

/**
 * Setting Top Z-Index
 * @param map
 * @param layerId
 */
function setTopZIndex(map, layerId) {
	var length = map.getLayers().getArray().length;
	map.getLayers().forEach(function(l) {
		var properties = l.getProperties();
		if (!properties.isBaseLayer) {
			if(properties.layerId == layerId){
				l.setZIndex(length);
			}
		}
	});
}



/***
 * 거리면적
 */
var sketch;
var helpTooltipElement;
var helpTooltip;
var measureTooltipElement;
var measureTooltip;
var continuePolygonMsg = '그려질 폴리곤의 다음 점을 선택하세요.';
var continueLineMsg = '그려질 선의 다음 점을 선택하세요.';

var measureDraw;
function addMeasureInteraction(map, mode) {
	setTopZIndex(map, 'measure');

	// 여러번석택 시 문제발생을 막기위함
	map.removeInteraction(measureDraw);
	measureDraw = null;

	var type = (mode == 'area' ? 'Polygon' : 'LineString');
	measureDraw = new ol.interaction.Draw({
		source : getLayerById(map, 'measure').getSource(),// measure_sourceVector,
		type : /** @type {ol.geom.GeometryType} */(type),
		style : new ol.style.Style({
			fill : new ol.style.Fill({
				color : 'rgba(255, 255, 255, 0.2)'
			}),
			stroke : new ol.style.Stroke({
				color : 'rgba(0, 0, 0, 0.5)', /*'rgba(255, 0, 0, 0.5)',*/
				lineDash : [ 10, 10 ],
				width : 3
			}),
			image : new ol.style.Circle({
				radius : 5,
				stroke : new ol.style.Stroke({
					color : 'rgba(0, 0, 0, 0.7)'
				}),
				fill : new ol.style.Fill({
					color : 'rgba(255, 255, 255, 0.2)'
				})
			})
		})
	});
	map.addInteraction(measureDraw);

	createMeasureTooltip(map);
	createHelpTooltip(map);

	var listener = null;
	measureDraw.on('drawstart', function(evt) {
		// set sketch
		sketch = evt.feature;

		/** @type {ol.Coordinate|undefined} */
		var tooltipCoord = evt.coordinate;

		listener = sketch.getGeometry().on('change', function(evt) {
			var geom = evt.target;
			var output = null;
			if (geom instanceof ol.geom.Polygon) {
				output = formatArea(/** @type {ol.geom.Polygon} */
				(geom));
				tooltipCoord = geom.getInteriorPoint().getCoordinates();
			} else if (geom instanceof ol.geom.LineString) {
				output = formatLength( /** @type {ol.geom.LineString} */
				(geom));
				tooltipCoord = geom.getLastCoordinate();
			}
			measureTooltipElement.innerHTML = output;
			measureTooltip.setPosition(tooltipCoord);
		});
	}, this);

	measureDraw.on('drawend', function(evt) {
		measureTooltipElement.className = 'measuretooltip tooltip-static';
		measureTooltip.setOffset([ 0, -7 ]);
		sketch = null;
		measureTooltipElement = null;
		createMeasureTooltip(map);
		ol.Observable.unByKey(listener);

		setTimeout(function() {
			map.removeInteraction(measureDraw);
			map.removeOverlay(helpTooltip);
			helpTooltip = null;
			$('#btn_area').removeClass('on');
			$('#btn_distance').removeClass('on');
		}, 100);

	}, this);




}

function createMeasureTooltip(map) {
	if (measureTooltipElement) {
		measureTooltipElement.parentNode.removeChild(measureTooltipElement);
	}
	measureTooltipElement = document.createElement('div');
	measureTooltipElement.className = 'measuretooltip tooltip-measure';
	measureTooltip = new ol.Overlay({
		element : measureTooltipElement,
		offset : [ 0, -15 ],
		positioning : 'bottom-center'
	});
	map.addOverlay(measureTooltip);
}

function createHelpTooltip(map) {
	if (helpTooltipElement) {
		helpTooltipElement.parentNode.removeChild(helpTooltipElement);
	}
	helpTooltipElement = document.createElement('div');
	helpTooltipElement.className = 'measuretooltip hidden';
	helpTooltip = new ol.Overlay({
		element : helpTooltipElement,
		offset : [ 15, 0 ],
		positioning : 'center-left'
	});
	map.addOverlay(helpTooltip);
}

/**
 * format length output
 * @param {ol.geom.LineString} line
 * @return {string}
 */
function formatLength(line) {
	var length;
	var coordinates = line.getCoordinates();
	length = 0;
	var sourceProj = ol.proj.get(epsg_cd);//var sourceProj = map.getView().getProjection();
	for (var i = 0, ii = coordinates.length - 1; i < ii; ++i) {
		var c1 = ol.proj.transform(coordinates[i], sourceProj, 'EPSG:4326');
		var c2 = ol.proj.transform(coordinates[i + 1], sourceProj,'EPSG:4326');
		length += wgs84Sphere.haversineDistance(c1, c2); // 지구 곡면을 고려
	}
	//length = Math.round(line.getLength() * 100) / 100; // 지구 곡면을 고려하지 않음
	var output;
	if (length > 100) {
		output = (Math.round(length / 1000 * 100) / 100) + ' ' + 'km';
	} else {
		output = (Math.round(length * 100) / 100) + ' ' + 'm';
	}
	return output;
};

/**
 * format length output
 * @param {ol.geom.Polygon} polygon
 * @return {string}
 */
function formatArea(polygon) {
	var area;
	var sourceProj = ol.proj.get('EPSG:900913');//var sourceProj = map.getView().getProjection();
	var geom = /** @type {ol.geom.Polygon} */ (polygon.clone().transform(sourceProj, 'EPSG:4326'));
	var coordinates = geom.getLinearRing(0).getCoordinates();
	area = Math.abs(wgs84Sphere.geodesicArea(coordinates)); // 지구 곡면을 고려
	//area = polygon.getArea(); // 지구 곡면을 고려하지 않음
	var output;
	if (area > 10000) {
		output = (Math.round(area / 1000000 * 100) / 100) + ' ' + 'km<sup>2</sup>';
	} else {
		output = (Math.round(area * 100) / 100) + ' ' + 'm<sup>2</sup>';
	}
	return output;
};

// 그리기 종료
function mapClear() {
	getLayerById(map, 'measure').getSource().clear();
	map.removeInteraction(measureDraw);
	map.getOverlays().clear();
	$.each(drawFreeLayers, function(idx, val) {
		map.removeLayer(val);
	});
	drawFreeLayers = [];
	map.removeInteraction(draw);
	draw = null;
	$(".ol-unselectable").css("cursor", "default");
}

// 지도 이동
function drawPause() {
	console.log("drawPause");
	if(draw != null) {
		draw.setActive(false);
		$(".ol-unselectable").css("cursor", "move");
	}
}

// 위경도 격자
var graticule = new ol.Graticule({
    strokeStyle: new ol.style.Stroke({
      color: 'rgba(255,0,0,0.9)',
      width: 2,
      lineDash: [0.5, 4]
    }),
    showLabels: true,
    xWrap: true,
    targetSize:200
  });

function setGrid() {

	if ($(".grid").hasClass('active')) {
		graticule.setMap(null);
	} else {
		graticule.setMap(map);
	}
}

