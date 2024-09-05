cd ../environments/dev
terraform graph -type=plan | dot -Tpng -o ../../graph.png