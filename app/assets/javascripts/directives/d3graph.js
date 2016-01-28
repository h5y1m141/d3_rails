angular.module('D3Rails').directive('d3Graph', ['d3Service', 'TechnicalWord', function (d3Service, TechnicalWord) {
  // D3.jsのラッピングとControllerとの連携は以下を参考に実装
  // http://qiita.com/Quramy/items/b701b824c2f42c683aa7
  var d3 = d3Service.d3;
  return{
    restrict: 'EAC',
    scope:{
      relationBaseWord: '=',
      relatinSearchFail: '='
    },
    link: function(scope, element){
      // 以下URLを参考に実装
      // http://bl.ocks.org/mbostock/1153292

      var width = 960,
          height = 500,
          links = [],
          nodes = [];
      var svg = d3.select(element[0])
            .append('svg')
            .attr('width', width)
            .attr('height', height);
      var force = d3.layout.force()
            .size([width, height])
            .linkDistance(function(link) {
              return 100;
            })
            .nodes(nodes)
            .links(links)
            .linkStrength(0.5)
            .charge(-300)
            .start();
      var link = svg.selectAll('.link'),
          node = svg.selectAll('.node');

      force.on('tick',function tick() {
        link
          .attr('x1', function(d) { return d.source.x; })
          .attr('y1', function(d) { return d.source.y; })
          .attr('x2', function(d) { return d.target.x; })
          .attr('y2', function(d) { return d.target.y; });
        node
          .attr('transform', function(d) { return 'translate(' + d.x + ',' + d.y + ')'; });
      });
      scope.render = function() {
        var data,
            params = {
              technical_word_name: scope.relationBaseWord
            };
        data = TechnicalWord.relation_words(params);
        renderNodesAndLinks(data);
      };
      scope.$watchCollection('relationBaseWord', function(){
        if(scope.relationBaseWord == ''){
          scope.relatinSearchFail = false;
        } else if(!scope.relationBaseWord){
          return;
        } else {
          resetNodesAndLinks();
          scope.render();
        }
      });
      function renderNodesAndLinks(data){
        data.$promise.then(function(word) {
          if(word.relation_words){
            scope.relatinSearchFail = false;
            appendItem(word.relation_words);
            node.append('circle')
              .attr('id', function(d) {
                return d.id;
              })
              .attr('r', 8);
            node.append('text')
              .attr('x', 12)
              .attr('dy', '.35em')
              .text(function(d) { return d.name; });
          } else {
            scope.relatinSearchFail = true;
          }
        });
      }
      function mouseover() {
        d3.select(this).select('circle').transition()
          .duration(750)
          .attr('r', 16);
      }
      function mouseout() {
        d3.select(this).select('circle').transition()
          .duration(750)
          .attr('r', 8);
      }
      function mouseclick() {
        var id,name;
        id = d3.select(this).select('circle').attr('id');
        name = d3.select(this).select('text').text();
        return scope.$parent.prepareRelationWords(id, name);
      }
      function mouseDoubleClick(){
        var data,
            params = {
              technical_word_name: d3.select(this).select('text').text()
            };
        data = TechnicalWord.relation_words(params);
        renderNodesAndLinks(data);
      }
      function appendItem(_links){
        _links.forEach(function(link) {
          link.source = nodes[link.source] || (nodes[link.source] = {id: link.source_id, name: link.source});
          link.target = nodes[link.target] || (nodes[link.target] = {id: link.target_id, name: link.target});
          links.push(link);
        });
        console.log('appendItem prepare done');
        console.log(links);
        restart();
      }
      function restart(){
        force.nodes(d3.values(nodes)).links(links);
        drawLink(links);
        drawItemNode(d3.values(nodes));
        force.start();
      }
      function drawItemNode(nodes){
        node = node.data(nodes);
        node.enter().append('g')
          .attr('class', 'node')
          .on('mouseover', mouseover)
          .on('mouseout', mouseout)
          .on('click', mouseclick)
          .on('dblclick', mouseDoubleClick)
          .call(force.drag);
      }
      function drawLink(links){
        link = link.data(links);
        link
          .enter().append('line')
          .attr('class', 'technical_word__contents__link');
      }
      function resetNodesAndLinks(){
        links = [];
        nodes = [];
        node = node.data([]);
        node.exit().remove();
        link = link.data([]);
        link.exit().remove();
      }
    }
  };
}]);
