function aem_start {
    cd ~/wrk/aem
    java -Xms1024m -Xmx2048m -debug -Xnoagent -Djava.compiler=NONE -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=30303 -jar cq-author-p4502.jar -nofork
}
